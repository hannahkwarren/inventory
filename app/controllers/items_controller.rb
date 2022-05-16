# app/controllers/items_controller.rb

class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

end
