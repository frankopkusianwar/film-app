class CreateCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :name, :string
    add_column :countries, :iso, :string
    add_column :states, :name, :string
    add_column :states, :iso, :string
    add_column :states, :country_id, :integer
  end
end
