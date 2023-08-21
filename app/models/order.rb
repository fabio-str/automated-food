class Order < ApplicationRecord
  belongs_to :user

  def self.change_meal(user)
    existing_order = user.orders.where(status: 'pending').first

    if existing_order
      existing_order.destroy

      daily_calorie_need = user.nutrition_profile.daily_calorie_need

      # Create a new order
      # Dish selection will now ensure total_calories are within +/- 2000 of the user's daily_calorie_need, this is just filler logic until I've figured out how to divide the caloric need for lunch
      dish = Dish.where("total_calories >= ? AND total_calories <= ?", daily_calorie_need - 3000, daily_calorie_need + 3000).order("RANDOM()").first

      if dish 
        return user.orders.create!(status: 'pending', dish_id: dish.id, dish_name: dish.name, dish_ingredients: dish.ingredients, price: dish.price, total_calories: dish.total_calories)
      else 
        dish_fallback = Dish.order("RANDOM()").first
        return user.orders.create!(status: 'pending', dish_id: dish_fallback.id, dish_name: dish_fallback.name, dish_ingredients: dish_fallback.ingredients, price: dish_fallback.price, total_calories: dish_fallback.total_calories)
      end 
    else
      # Return nil if no existing pending order found
      return nil
    end
  end

  def self.current_pending_order(user)
    user.orders.where(status: 'pending').first
  end

end