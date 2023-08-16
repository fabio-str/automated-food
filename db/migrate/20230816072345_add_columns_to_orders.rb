class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :dish_id, :string
    add_column :orders, :dish_name, :string
    add_column :orders, :dish_ingredients, :string
    add_column :orders, :price, :string
    add_column :orders, :total_calories, :string
  end
end
