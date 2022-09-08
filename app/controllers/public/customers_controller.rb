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
      @customers = Customer.find(params[:id])
        if @customers.update(customer_params)
         redirect_to customer_path
        else
         render :edit_customer
        end
    end

    def unsubscribe
      @customer = Customer.find(params[:id])
    end

    def withdraw
      @customer = Customer.find(params[:id])
      @customer.update(is_valid: false)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end


  private
  def customer_params
      params.require(:customer_id).permit(:item_id, :amount)
  end

end
