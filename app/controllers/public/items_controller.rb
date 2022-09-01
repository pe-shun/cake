class Public::ItemsController < ApplicationController

    def index
     @item = Item.new
     @items = Items.all
     @user = current_user
    end

    def edit
    end

    def create
     @itmes = itmes.new(book_params)
     @itmes.user_id = current_user.id
      if @items.save
       redirect_to book_path(@items.id)
      else
     @items = current_user
     @items = Items.all
       render :index
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

end
