class Api::V1::CustomersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
      @customers = Customer.all
      render json: @customers
    end

   def create
    @customer = Customer.create(customer_params)
    if @customer.valid?
      token = encode_token({ user_id: @customer.id })
      render json: { customer: CustomerSerializer.new(@customer), jwt: token }, status: :created
    else
      render json: { error: 'failed to create customer' }, status: :not_acceptable
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :password, :last_name, :email, :phone_number)
  end
end
