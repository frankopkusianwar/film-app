class OpinionsController < ApplicationController

  def new
     @opinion  = Opinion.new
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
    opinion = Opinion.new(params.require(:opinion).permit(:Text, :clip))
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
    @opinion = Opinion.find(params[:id])
    if @opinion.update(opinion_params)
      redirect_to opinion_path(@opinion)
    else
      render 'edit'
    end
  end

  private
  
  def opinion_params
    params.require(:opinion).permit(:text, :image)
  end

end
