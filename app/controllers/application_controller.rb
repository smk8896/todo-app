class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # Helper methods are available to the controllers and views
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate!
    redirect_to :signin unless current_user
  end
end
