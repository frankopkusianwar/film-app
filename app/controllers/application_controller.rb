class ApplicationController < ActionController::Base
  include SessionsHelper
  include AdminSessionsHelper

  helper_method :logged_in?
  def logged_in?
    !current_user.nil?
  end

  helper_method :admin_logged_in?
  def admin_logged_in?
    !current_admin.nil?
  end
end
