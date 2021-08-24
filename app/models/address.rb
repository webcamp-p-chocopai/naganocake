class Address < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code, format: { with:/\A[0-9０-９]+\z/ }, length: {is: 7}, presence: true
  validates :address, presence: true
  validates :dear_name, presence: true
end
