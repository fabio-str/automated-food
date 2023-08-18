class AddDailyCalorieIntakeToNutritionProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :nutrition_profiles, :daily_calorie_need, :integer
  end
end
