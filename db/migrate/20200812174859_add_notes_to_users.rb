class AddNotesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notes, :string
  end
end
