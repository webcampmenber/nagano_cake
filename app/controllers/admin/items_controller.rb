class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item.id)
    else
     render :new_admin_item_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image)  
  end

end
