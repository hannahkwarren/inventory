# frozen_string_literal: true

# app/controllers/warehouses_controller.rb
class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.create(warehouse_params)
    if @warehouse.save
      flash[:success] = 'Warehouse location created!'
      redirect_to warehouses_path
    else
      render new_warehouse_path, notice: @warehouse.errors.full_messages.to_sentence
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :address, :city, :state, :zip)
  end
end
