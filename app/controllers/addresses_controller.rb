class AddressesController < ApplicationController
  before_action :set_address

  def show
  end

  def new
    if current_user.address
      @address = current_user.address
    else
      @address = current_user.build_address
    end
  end

  def create
    @address = current_user.build_addresse(address_params)

    if current_user.address.nil?
      if @address.save
        redirect_to @address, notice: 'Address was successfully created.'
      else
        render :new
      end
    else
      if @address.update(address_params)
        redirect_to @address, notice: 'Address was updated successfully.'
      else
        render :edit, alert: 'Address could not be saved. Please try again.'
      end
    end
  end

  def update
   if @address.update(address_params)
     redirect_to @address, notice: 'Address was successfully updated.'
   else
     render :edit, alert: 'Address could not be updated. Please try again.'
   end
  end

  private 

  def set_address
    @address = current_user.address
  end

  def address_params
    params.require(:address).permit(:country, :city, :street, :postcode, :region, :delivery_time)
  end
  
end
