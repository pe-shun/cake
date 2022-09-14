class Public::CartItemsController < ApplicationController

   before_action :correct_customer_destroy_all, only: :destroy_all

   def index
    @cart_items = Cart_items.new
    @cart_items = Cart_items.all
    @customer = current_customer
   end

   def destroy
    @cart_items = Cart_items.find(params[:id])
    @cart_items.destroy
    redirect_to items_path
   end

   def destroy_all
    @tasks.destroy_all
     flash[:danger] = "全て削除しました!"
    redirect_to request.referrer || items_path
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

   def correct_customer_destroy_all
    @tasks = current_customer.tasks
    redirect_to root_url if @tasks.nil?
   end

end
