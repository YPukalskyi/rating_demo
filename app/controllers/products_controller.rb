class ProductsController < ApplicationController
  def index
    @filter_service = ::Products::FilterService.new.call(
      filter_params:
    )

    @products = @filter_service.products.page(params[:page])
  end

  def show
    @product  = Product.find(params[:id])
  end

  private

  def filter_params
    return {} if params[:filters].blank?

    params.require(:filters).permit(
      :term,
      :average_rating
    )
  end
end
