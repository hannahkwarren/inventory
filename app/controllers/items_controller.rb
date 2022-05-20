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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      flash[:alert] = 'Error: Item failed to update.'
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :weight_lbs)
  end
end
