class Customers::HomesController < ApplicationController
  def top
    #新着商品を４件のみ表示したい
    @item = Item.order(created_at: :desc).limit(4)
    @genre = Genres.all
  end

  def about
  end
end
