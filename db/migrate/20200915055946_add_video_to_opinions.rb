class AddVideoToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :video, :string
  end
end
