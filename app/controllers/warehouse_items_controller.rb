# app/controlelrs/warehouse_items_controller.rb

class WarehouseItemsController < ApplicationController
  def index
    @warehouse_items = WarehouseItem.all
  end

  def new
    @warehouse_item = WarehouseItem.new
  end

  def create
    # binding.pry
    @warehouse_item = WarehouseItem.create(warehouse_item_params)

    if @warehouse_item.save
      flash[:success] = "#{@warehouse_item.id} created!"
      redirect_to inventory_path
    else
      flash[:alert] = "Error: #{error_message(@warehouse_item.errors)}"
      redirect_to new_warehouse_item_path
    end
  end

  private

  def warehouse_item_params
    params.require(:warehouse_item).permit(:warehouse_id, :item_id, :quantity, :aisle)
  end
end
