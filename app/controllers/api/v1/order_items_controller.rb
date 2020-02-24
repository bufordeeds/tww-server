class Api::V1::OrderItemsController < ApplicationController
skip_before_action :authorized, only: [:create, :index]
  def index
      @order_items = OrderItem.all
      render json: @order_items
  end

  def create
    @order_item = OrderItem.create(order_item_params)
    if @order_item.valid?
    render json: @order_item, status: :created
    else
      render json: { error: 'failed to create order item' }, status: :not_acceptable
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :quantity)
    
  end
  
end