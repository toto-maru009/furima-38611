class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :municipality, :address, :building_name, :telephone_number, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :municipality 
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "10桁以上11桁以内の半角数値のみ"  }
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }

  def save
    # 購入についての情報を変数purchaseに代入
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    #住所の保存
    Buyer.create(postal_code: postal_code, :municipality municipality, :address address, :building_name building_name, :telephone_number telephone_number, :prefecture_id prefecture_id, purchase_id: purchase.id)
  end
end