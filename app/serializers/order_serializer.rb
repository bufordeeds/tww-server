class OrderSerializer < ActiveModel::Serializer
  attributes :id, :completed, :customer_id, :updated_at
end
