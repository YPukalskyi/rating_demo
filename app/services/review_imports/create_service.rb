module ReviewImports
  class CreateService
    def call(user:, params:)
      @user   = user
      @params = params

      create
      import_csv_file
    end

    private

    def create
      @review_import = @user.review_imports.create(@params)
    end

    def import_csv_file
      return unless @review_import.persisted?

      ::Feedbacks::ImportCsvJob.perform_now(review_import: @review_import)
    end
  end
end
