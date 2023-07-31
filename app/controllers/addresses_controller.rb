class AddressesController < ApplicationController
    before_action :set_address, only: %i[edit new create update index]
  
    def edit
    end

    def index
    end


    def new
      @address = Address.new
    end
  
    def create
      @address = Address.new(address_params)
  
      respond_to do |format|
        if @address.save
          format.html { redirect_to address_url(@address), notice: "address was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
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
      @address = current_user.addresses
    end
  
    def address_params
      params.require(:address).permit(:country, :city, :street, :postcode, :region, :delivery_time)
    end
    
end
  