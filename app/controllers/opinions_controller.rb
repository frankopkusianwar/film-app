class OpinionsController < ApplicationController
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
end
