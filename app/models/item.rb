class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :customers, through: :cart_items

  attachment :item_image
  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :non_taxed_price, presence: true
  validates :genre_id, presence: true

  def short_description
    description[0, 9] + '...'
  end

end
