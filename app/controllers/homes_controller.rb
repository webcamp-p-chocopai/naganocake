class HomesController < ApplicationController
  def top
    @item = Item.find(params:id)
  end

  def about
  end
end
