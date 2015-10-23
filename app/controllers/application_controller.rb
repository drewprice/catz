class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :init_focus

  private

  def user_signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if !user_signed_in? && params[:cat]
      session[:tmp_cat_params] = cat_params
      redirect_to '/auth/twitter'
    elsif !user_signed_in?
      render 'shared/sign_in_alert'
    end
  end

  def init_focus
    if request.env["HTTP_ACCEPT"].include? 'html'
      session[:focus] = ENV['FOCUS']
    else
      session[:focus] ||= ENV['FOCUS']
    end
  end

  def set_focus(focus)
    session[:focus] = focus
  end

  def reset_focus
    session[:focus] = ENV['FOCUS']
  end

  def current_focus
    session[:focus]
  end

  helper_method :current_user, :user_signed_in?, :current_focus
end
