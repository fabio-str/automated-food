class AddressesController < ApplicationController
    before_action :set_address, only: %i[edit update]
  
    def edit
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
      # Assuming addresses are nested under the users
      @user = User.find(params[:user_id])
      @address = @user.address
    end
  
    def address_params
      params.require(:address).permit(:country, :city, :street, :postcode, :delivery_time)
    end
    
end
  