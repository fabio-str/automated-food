class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :index]

  def edit
  end

  def index
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = current_user.addresses.build(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to edit_address_path(@address), notice: "address was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        p @address.errors.full_messages
      end
    end
  end

  def update
   if @address.update(address_params)
     redirect_to @user, notice: 'Address was successfully updated.'
   else
     render :edit
   end
  end

  private 

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:country, :city, :street, :postcode, :region, :delivery_time)
  end
  
end
