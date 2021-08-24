class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer




  # 郵便番号は数字記述のみ、７文字のみ、空白なし
  validates :postal_code, format: { with:/\A[0-9０-９]+\z/ }, length: {is: 7}, presence: true
  # 住所空白なし
  validates :dear_address, presence: true
  # 宛名空白なし
  validates :dear_name, presence: true

  # 注文ステータス
  enum orderd_status:{入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  # 支払方法
	enum method_of_payment:{ クレジットカード支払い: 0, 銀行振込: 1}


end
