class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :current_user

  protect_from_forgery with: :exception

  helper_method :current_user

  def authorize
    unless current_user
      flash[:alert] = "Você não tem autorização para esta página."
      redirect_to '/'
    end
  end

  def current_user
  if session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
end
