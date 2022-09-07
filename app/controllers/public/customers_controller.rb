class Public::CustomersController < ApplicationController

    def show
    end

    def edit
      @customer = Customer.find(params[:id])
     if @customer.user != current_user
       redirect_to customer_path
     end
    end

    def update
      @items = Items.find(params[:id])
        if @items.update(items_params)
         redirect_to items_path
        else
         render :edit_item
        end
    end

    def unsubscribe
    end

    def withdraw
    end


  private
  def customer_params
      params.require(:customer_id).permit(:item_id, :amount)
  end

end
