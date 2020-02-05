class Customer < ApplicationRecord
  has_secure_password
  has_one :address_book
  has_many :orders
  has_many :payment_methods

  validates :email, uniqueness: { case_sensitive: false }
end
