class Api::V1::ItemsController < ApplicationController
skip_before_action :authorized, only: [:create, :index]
  def index
      @items = Item.all
      render json: @items
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
    render json: { item: ItemSerializer.new(@item)}, status: :created
    else
      render json: { error: 'failed to create item' }, status: :not_acceptable
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :type)
    
  end
  
end
