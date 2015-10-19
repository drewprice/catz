class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def user_signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user, :user_signed_in?
end
