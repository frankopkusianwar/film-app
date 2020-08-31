class RemoveEmailFromAdmin < ActiveRecord::Migration[6.0]
  def change
    remove_column :admins, :email, :string
  end
end
