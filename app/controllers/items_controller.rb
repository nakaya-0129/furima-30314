class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :item_set, only: [:edit,:update,:show]

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def edit
    if @item.user_id == current_user.id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
  end
end

  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  
  private
  def item_params
    params.require(:item).permit(:image,:name,:decription,:price,:status_id,:category_id,:shipping_cost_id,:shipping_area_id,:ship_day_id).merge(user_id: current_user.id)
  end
  
  def item_set
    @item = Item.find(params[:id])
  end
end