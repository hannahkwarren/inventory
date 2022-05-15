# app/models/warehouse_item.rb

class WarehouseItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  validates :aisle, :quantity, presence: true
end
