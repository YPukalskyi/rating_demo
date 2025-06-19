module Feedbacks
  class ImportCsvService
    DEFAULT_BATCH_SIZE = 500

    def call(review_import:)
      @review_import = review_import

      import_data
    end

    private

    def import_data
      SmarterCSV.process(file_path, smarter_csv_options) do |batch|
        valid_data = filter_valid_data(batch)

        next if valid_data.blank?

        ::Feedback.insert_all(valid_data)
      end
    end

    def file_path
      ::ActiveStorage::Blob.service.path_for(@review_import.file.key)
    end

    def smarter_csv_options
      {
        user_provided_headers: %i[user_id product_id rating comment],
        chunk_size:            DEFAULT_BATCH_SIZE
      }
    end

    def filter_valid_data(batch)
      user_ids    = batch.pluck(:user_id)
      product_ids = batch.pluck(:product_id)

      valid_user_ids    = ::User.where(id: user_ids).pluck(:id)
      valid_product_ids = ::Product.where(id: product_ids).pluck(:id)

      return [] if valid_user_ids.blank? || valid_product_ids.blank?

      batch.filter do |b|
        valid_user_ids.include?(b[:user_id])                                &&
        valid_product_ids.include?(b[:product_id])                          &&
        b[:rating].between?(::Feedback::MIN_RATING, ::Feedback::MAX_RATING)
      end
    end
  end
end
