class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[ edit update destroy ]

  # GET /orders
  def index
    @orders = Order.all
  end

  def edit
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    Order.create_random_dish_order(current_user)
    redirect_to root_path, notice: "Your order has been created successfully."
  end

  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # Change Meal Functionality on Dashboard
  def change_meal
    @order = Order.change_meal(current_user)
  
    if @order
      flash[:notice] = "Your order has been changed successfully."
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "You don’t have an order yet."
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to dashboard_index_path, notice: 'Order has been deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_rating, :user_feedback, :user_id, :status, :dish_id, :dish_name, :dish_ingredients, :price, :total_calories)
    end
end
