class AddShortBioToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :short_bio, :textfield
  end
end
