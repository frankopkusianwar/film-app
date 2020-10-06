class AddOpinionIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :opinion_id, :integer
    add_column :likes, :user_id, :integer
  end
end
