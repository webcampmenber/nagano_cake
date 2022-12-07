class Public::HomesController < ApplicationController
  
  def top
    @items = Item.all.order(id: "DESC").limit(4)
  end
   
  def about
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active, :genre_id)  
  end
  
end
