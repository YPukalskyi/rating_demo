class ReviewImportsController < ApplicationController
  def create
    ::ReviewImports::CreateService.new.call(
      user: current_user,
      params: review_imports_params
    )

    redirect_to products_path
  end

  private

  def review_imports_params
    params.require(:review_imports).permit(
      :file
    )
  end
end
