# app/models/warehouse_item.rb

class WarehouseItem < ApplicationRecord
  belongs_to :item
  belongs_to :warehouse
  validates :aisle, :quantity, presence: true
end
