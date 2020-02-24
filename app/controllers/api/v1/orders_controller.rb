class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :edit, :update]
  def index
      @orders = Order.all
      render json: @orders
  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
    render json: { order: OrderSerializer.new(@order)}, status: :created
    else
      render json: { error: 'failed to create order' }, status: :not_acceptable
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    @order.update(order_params)
    render json: @order, status: :accepted
  end


  private
  def order_params
    params.require(:order).permit(:completed, :customer_id)
    
  end
end
