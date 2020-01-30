class Api::V1::CustomersController < ApplicationController
    skip_before_action :authorized, only: [:create]

   def create
    @customer = Customer.create(customer_params)
    if @customer.valid?
      render json: { customer: CustomerSerializer.new(@customer) }, status: :created
    else
      render json: { error: 'failed to create customer' }, status: :not_acceptable
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :password, :last_name, :email, :phone_number)
  end
end
