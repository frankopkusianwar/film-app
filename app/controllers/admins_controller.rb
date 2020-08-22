class AdminsController < ApplicationController

    def new
        @admin = Admin.new
    end


  def show
    @admin = Admin.find(params[:id])
  end
    def index
        @user = User.all
    end
    
    def create
      @admin = Admin.new(params.require(:admin).permit(:email, :password))
      if @admin.save
        redirect_to admins_path
      else
        @errors = @user.errors.full_messages
        render 'admin/new'
      end
    end
end
