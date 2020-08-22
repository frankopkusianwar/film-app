class AdminSessionsController < ApplicationController

    def new
        @admin = Admin.new
    end

    def index
        @admin = Admin.new
    
    end
  
    def create
        @admin = Admin.find_by(email: params[:email])
      
      if @admin && @admin.password == params[:password]
        log_in @admin
        redirect_to admins_path
      else 
         flash[:alert] = 'wrong User'
         redirect_to root_path
      end
    end
  
    def destroy
      log_out
      redirect_to root_path
    end
  end