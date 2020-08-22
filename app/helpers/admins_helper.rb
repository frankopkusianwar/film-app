module AdminsHelper
      # Logs in the given user.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def logged_in?
    !current_admin.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end


  def current_admin?(admin)
    admin && admin == current_admin
  end

end
