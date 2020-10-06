module OpinionsHelper
  def like_or_dislike_btn(opinion)
    like = Like.find_by(opinion: opinion, user: current_user)
    if like
      link_to('Dislike!', opinion_like_path(id: like.id, opinion_id: opinion.id), method: :delete)
    else
      link_to('Like!', opinion_likes_path(opinion_id: opinion.id), method: :post)
    end
  end

  def like_count(opinion)
    @opinion = opinion
    render 'opinions/user_opinions'
  end
end
