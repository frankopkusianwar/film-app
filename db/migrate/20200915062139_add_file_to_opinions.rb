class AddFileToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :file, :string
  end
end
