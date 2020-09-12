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
    redirect_to opinions_new_path
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to opinions_path
  end

  def update
    @opinion = opinion.find(params[:id])
    if @opinion.update_attributes(params[:post])
        redirect_to opinion_path(@opinion)
        flash[:notice] = 'post was updated.'
    else
        render 'edit'
    end
end    

    def edit
        @opinion = opinion.find(params[:id])
    end

end
