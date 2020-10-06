class AddArtTypeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :art_type, :string
  end
end
