class Customer < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
end
