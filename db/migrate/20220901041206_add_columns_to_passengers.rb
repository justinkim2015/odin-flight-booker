class AddColumnsToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :name, :string
    add_column :passengers, :email, :string
  end
end
