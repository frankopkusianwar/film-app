module AdminSessionsHelper

# Logs in the given user.
  def log_in_admin(admin)
    byebug
    session[:admin_id] = admin.id
  end

  # Logs out the current user.
  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

  def current_admin?(admin)
    user && user == current_admin
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end
end
