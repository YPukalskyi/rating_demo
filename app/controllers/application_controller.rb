class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  private

  # Simulates the current_user after authentication
  def current_user
    User.order("RANDOM()").first
  end
end
