class AddFunctionToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :function, :string
  end
end
