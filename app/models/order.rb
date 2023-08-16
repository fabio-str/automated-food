class Order < ApplicationRecord
  belongs_to :user

  def self.change_meal(user)
    existing_order = user.orders.where(status: 'pending').first

    if existing_order
      existing_order.destroy

      # Create a new order
      dish = Dish.order("RANDOM()").first
      return user.orders.create!(status: 'pending', dish_id: dish.id, dish_name: dish.name, dish_ingredients: dish.ingredients, price: dish.price, total_calories: dish.total_calories)
    else
      # Return nil if no existing pending order found
      return nil
    end
  end

  def self.current_pending_order(user)
    user.orders.where(status: 'pending').first
  end

end
