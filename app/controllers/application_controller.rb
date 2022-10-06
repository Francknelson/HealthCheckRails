class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  helper_method :current_user

  def authorize
    unless current_user
      flash[:alert] = "Você não tem autorização para esta página."
      redirect_to '/'
    end
  end

  private
  def current_user
  if session[:user_id]
    @current_user = Person.find(session[:user_id])
  end
end
end
