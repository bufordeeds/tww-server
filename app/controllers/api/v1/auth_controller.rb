class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
  def create
    @customer = Customer.find_by(email: customer_login_params[:email])
    #Customer#authenticate comes from BCrypt
    if @customer && @customer.authenticate(customer_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @customer.id })
      render json: { customer: CustomerSerializer.new(@customer), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end
 
  private
 
  def customer_login_params
    # params { customer: {email: 'example@email.com', password: 'hi' } }
    params.require(:customer).permit(:email, :password)
  end
end
