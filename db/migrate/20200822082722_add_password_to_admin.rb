class AddPasswordToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :password, :string
  end
end
