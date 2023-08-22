class OrderMailer < ApplicationMailer
    def new_pending_order(user, order)
        @dish_name = order.dish_name
        @ingredients = order.dish_ingredients
        @total_calories = order.total_calories

        @user = User.find(user.id) # set @user instance
        @address = @user.address
        @nutrition_profile = @user.nutrition_profile

        mail(to: user.email, subject: 'Your daily lunch order')
    end
end
  