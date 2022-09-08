class Public::CartItemsController < ApplicationController

   def index
   end

   def destroy
   end


   def create
     @cart_itmes = Itmes.new(book_params)
     @cart_itmes.customer_id = current_customer.id
     @cart_items = current_customer.items.all
     @cart_items.each do |item|
        if cart_item.item_id==@cart_item.item_id
        new_quantity = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, new_quantity)
        @cart_item.delete
        end
       end

       @cart_item.save
       redirect_to items_path,notice:"カートに商品が入りました"
   end

   def update
      @cart_items = cart_Items.find(params[:id])
        if @cart_items.update(cart_items_params)
         redirect_to items_path
        else
         render :edit_item
        end
   end

 private
   def cart_item_params
      params.require(:cart_item).permit(:quantity, :item_id, :customer_id, :amount)
   end

end
