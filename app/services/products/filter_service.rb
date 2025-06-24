module Products
  class FilterService
    attr_reader :products, :filter_params

    def call(filter_params:)
      @filter_params = filter_params

      filter
      filter_by_term
      filter_by_average_rating

      sort_by

      self
    end

    private

    def filter
      @products = ::Product.left_joins(:feedbacks)
                           .select("
                             products.*,
                             ROUND(COALESCE(AVG(feedbacks.rating), 0.0), 1) AS avg_rating,
                             COUNT(feedbacks.id)                            AS feedbacks_count
                           ")
                           .group("products.id")
    end

    def filter_by_term
      return if @filter_params[:term].blank?

      @products = @products.where("title LIKE ?", "#{@filter_params[:term]}%")
    end

    def filter_by_average_rating
      return if @filter_params[:average_rating].blank?

      @products = @products.having("avg_rating >= ?", @filter_params[:average_rating].to_f)
    end

    def sort_by
      @products = @products.order(
        Arel.sql("AVG(feedbacks.rating) DESC NULLS LAST, feedbacks_count DESC")
      )
    end
  end
end
