# app/models/item.rb

class Item < ApplicationRecord
  has_many :warehouse_items
  has_many :warehouses, through: :warehouse_items
  validates :weight_lbs, presence: true, numericality: true

  def full_name
    "#{name}, #{description}"
  end
end
