class AddIndexToLikesTable < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, :user_id, name: 'index_likes_on_user_id' 
    add_index :likes, :opinion_id, name: 'index_likes_on_opinion_id'
  end
end
