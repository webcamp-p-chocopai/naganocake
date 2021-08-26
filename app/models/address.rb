class Address < ApplicationRecord
  belongs_to :customer

  validates :postal_code, format: { with:/\A[0-9０-９]+\z/ }, length: {is: 7}, presence: true
  validates :address, presence: true
  validates :dear_name, presence: true

  # ↓〒＋郵便番号＋住所＋名前を一度にだすための定義
  def all_address
    "〒"+self.postal_code+"　"+self.address+"　"+self.dear_name
  end

end
