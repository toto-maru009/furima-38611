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
end