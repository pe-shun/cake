class Public::OrdersController < ApplicationController
  
  def new
  end
  
  def comfirm
  end
  
  def complete
  end

  def create
  end 
  
  def index
   @cart_items = Cart_items.new
   @cart_items = Cart_items.all
   @customer = current_customer
  end
  
  def show
  end

end
