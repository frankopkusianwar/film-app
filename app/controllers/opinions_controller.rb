class OpinionsController < ApplicationController

  def new
     @opinion  = Opinion.new
  end

  def show
    @opinion = Opinion.find(params[:id])
  end
  
  def index
    @opinion = Opinion.new
    @opinions = Opinion.includes(:user).includes(:comments)
    @opinions = []
    current_user.following.each do |user|
      user.opinions.each do |opinion| 
        @opinions << opinion
      end

    end
    @users = User.all
    @comment = Comment.new
  end

  def create
    opinion = Opinion.new(params.require(:opinion).permit(:Text, :clip, :image, :video, :file))
    opinion.user_id = session[:user_id]
    opinion.save
    redirect_to opinions_path
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to opinions_path
  end

  def edit
    @opinion = Opinion.find(params[:id])
  end

  def update
    @user = current_user
    @opinion = Opinion.find(params[:id])
    if @opinion.update(opinion_params)
     
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def opinion_params  
    params.require(:opinion).permit(:Text, :clip, :image, :video, :file)
  end

end
