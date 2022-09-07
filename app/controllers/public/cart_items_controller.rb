class Public::CartItemsController < ApplicationController

   def create
     @itmes = Itmes.new(book_params)
     @itmes.customer_id = current_customer.id
     @items = current_customer.items.all
     @items.each do |item|
        if item.item_id==@item.item_id
        new_quantity = item.quantity + @item.quantity
        item.update_attribute(:quantity, new_quantity)
        @item.delete
        end
       end

       @item.save
       redirect_to items_path,notice:"カートに商品が入りました"
   end

   def update
      @items = Items.find(params[:id])
        if @items.update(items_params)
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
