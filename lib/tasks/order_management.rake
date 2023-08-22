namespace :order_management do
    desc 'Updates pending orders to delivered.'
    task :update => :environment do
      Order.where(status: 'pending').update_all(status: 'delivered')
    end

    desc 'Creates new orders for each user'
    task :new => :environment do
        User.find_each do |user|
            order = Order.create_random_dish_order(user)
            OrderMailer.new_pending_order(user).deliver_later(wait: 12.hours) if order # TODO: Adjust time that it syncs with pending order creation task
        end
    end


end
  