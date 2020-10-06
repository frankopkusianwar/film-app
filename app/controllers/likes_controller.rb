class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(opinion_id: params[:opinion_id])

    if @like.save
      redirect_to opinions_path, notice: 'You liked a post.'
    else
      redirect_to opinions_path, alert: 'You cannot like this post.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, opinion_id: params[:opinion_id])
    if like
      like.destroy
      redirect_to opinions_path, notice: 'You disliked a post.'
    else
      redirect_to opinions_path, alert: 'You cannot dislike post that you did not like before.'
    end
  end
end
