class RemoveTotalCaloriesFromDishes < ActiveRecord::Migration[7.0]
  def change
    remove_column :dishes, :total_calories
  end
end
