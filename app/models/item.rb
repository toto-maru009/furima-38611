class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  #ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :payee
  belongs_to :prefecture
  belongs_to :period

  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999 , message: "半角数字で¥300~¥9,999,999の間のみ出品可能"},format: { with: /\A[0-9]+\z/.freeze }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :payee_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :period_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }


end
