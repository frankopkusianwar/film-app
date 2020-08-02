class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :DOB, :string
    add_column :users, :userType, :string
    add_column :users, :bio, :text
  end
end
