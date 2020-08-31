class AdminSessionsController < ApplicationController
  def new
  end

  def index
  
  end

  def create
    @admin = Admin.find_by(email: params[:admin_session][:email])
    if @admin && @admin.password == params[:admin_session][:password]
      log_in_admin @admin
      redirect_to admins_path
    else 
       flash[:alert] = 'wrong User'
       render 'admin_sessions/new'
    end
  end

  def destroy
    log_out_admin
    redirect_to root_path
  end
end
