class AddFieldsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :title, :string
    add_column :projects, :description, :string
    add_column :projects, :DOP, :string
    add_column :projects, :videoLength, :string
    add_column :projects, :artType, :string
  end
end
