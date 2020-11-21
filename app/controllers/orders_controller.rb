class OrdersController < ApplicationController
  before_action :authenticate_user!  
before_action :set_order, only:[:index,:create]

  def index
   @order_address = OrderAddress.new
   if @item.user_id == current_user.id || @item.order.present?
    redirect_to root_path
   end
  end

  def create
   @order_address = OrderAddress.new(order_address_params)
  if  @order_address.valid?
      pay_item
      @order_address.save
     redirect_to root_path
  else
    render :index
  end
end

  private

def order_address_params
  params.require(:order_address).permit(:postal_code, :shipping_area_id,:municipal,:house_number,:building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
end

def set_order
  @item = Item.find(params[:item_id])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       amount: @item.price,
       card: order_address_params[:token],
       currency: 'jpy'
       )
end
end
