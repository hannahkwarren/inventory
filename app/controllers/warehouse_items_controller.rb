# app/controlelrs/warehouse_items_controller.rb

class WarehouseItemsController < ApplicationController
  def index
    @warehouse_items = WarehouseItem.all
  end

  def new
    @warehouse_item = WarehouseItem.new
  end

  def create
    @warehouse_item = WarehouseItem.create(warehouse_item_params)

    if @warehouse_item.save
      flash[:success] = "#{@warehouse_item.item.name} inventory created!"
      redirect_to warehouse_path(@warehouse_item.warehouse)
    else
      redirect_to new_warehouse_item_path, notice: @warehouse_item.errors.full_messages.to_sentence
    end
  end

  private

  def warehouse_item_params
    params.require(:warehouse_item).permit(:warehouse_id, :item_id, :quantity, :aisle)
  end
end
