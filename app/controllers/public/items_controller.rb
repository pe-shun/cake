class Public::ItemsController < ApplicationController

 def index
  @item = Item.new
  @items = Items.all
  @user = current_user
 end

 def show
  @item = Item.find(params[:id])
  @items = Item.all
  @newitem = Item.new
 end

private
  def cart_item_params
      params.require(:cart_item).permit(:quantity, :item_id, :customer_id, :amount)
  end

end
