class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :desc)
    @pending_orders = Order.where(status: 'pending').all
  end
end
