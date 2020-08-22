class ApplicationController < ActionController::Base
  include SessionsHelper
  include AdminSessionsHelper
  
  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_admin
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end
end
