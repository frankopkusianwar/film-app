class SessionsController < ApplicationController

  def new
  end

  def index
  
  end

  def create
    if params[:email] != nil
      user = User.find_by(email: params[:email])
    else 
      user = User.find_by(email: params[:phone])
    end
    if user && user.password == params[:password]
      log_in user
      redirect_to opinions_path
    else 
       flash[:alert] = 'wrong User'
       render new_session_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
