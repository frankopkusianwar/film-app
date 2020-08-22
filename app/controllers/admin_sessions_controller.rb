class AdminSessionsController < ApplicationController
  def new
  end

  def index
  
  end

  def create
    @admin = Admin.find_by(email: params[:email])
    if @admin && @admin.password == params[:password]
      log_in @admin
      redirect_to admins_path
    else 
       flash[:alert] = 'wrong User'
       render 'admin_sessions/new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
