# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      flash[:success] = "#{@item.name} created!"
      redirect_to item_path(@item)
    else
      flash[:alert] = "Error: #{error_message(@item.errors)}"
      redirect_to new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :weight_lbs)
  end

end
