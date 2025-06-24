class FeedbacksController < ApplicationController
  def create
    product        = Product.find(params[:product_id])
    @feedback      = product.feedbacks.build(feedback_params)
    @feedback.user = current_user

    @feedback.save
  end

  private

  def feedback_params
    params.require(:feedback).permit(
      :comment,
      :rating
    )
  end
end
