class AddClipToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :clip, :string
  end
end
