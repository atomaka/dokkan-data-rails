class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= GuestUser.new
  end

  def logged_in?
    @logged_in ||= current_user.class.name.demodulize == 'User'
  end
end
