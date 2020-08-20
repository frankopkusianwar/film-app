class AdminsController < ApplicationController

    def new
        @admin = Admin.new
    end


  def show
    @admin = Admin.find(params[:id])
  end
    
    def index
        @admin = Admin.all
    end
    
    def create
        @admin = Admin.new(params.require(:admin).permit(:email, :password))
        log_in(@admin)
        if @admin.save
          flash[:notice] = 'Admin created successfully!'
          redirect_to admins_path
        else
          @errors = @admin.errors.full_messages
          render 'admin/new'
        end
      end
end
