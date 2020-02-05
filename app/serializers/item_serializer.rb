class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :item_type
end
