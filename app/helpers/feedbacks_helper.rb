module FeedbacksHelper
  def active_filter_average_rating?(filter_service, rating)
    filter_service.filter_params[:average_rating].to_i == rating
  end
end
