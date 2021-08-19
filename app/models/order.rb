class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer
  
  def add_tax_price
    (self.price * 1.1).round
  end
  
end
