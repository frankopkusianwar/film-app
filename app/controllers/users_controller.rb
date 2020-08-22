class UsersController < ApplicationController
  before_action :check_user, only: [:show]

  def new
    @user = User.new
  end

  def following
    @user = User.find_by(params[:id])
    @following = @user.following
  end

  def followers 
    @user = User.find_by(params[:id])
    @followers = @user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :phone, :password, :state, :nationality, :firstName, :lastName, :userType, :DOB))
    if @user.save
      redirect_to new_project_path
    else
      @errors = @user.errors.full_messages
      render 'users/new'
    end
  end

  def check_user
    redirect_to root_path if current_user != User.find(params[:id])

    flash[:alert] = 'You can only see your own profile.' if current_user != User.find(params[:id])
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :email, :phone, :image, :cover_image, :password, :state, :nationality, :firstName, :lastName, :userType, :DOB)
  end

end
