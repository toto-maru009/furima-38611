class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :payee
  belongs_to :prefecture
  belongs_to :period

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :payee_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :period_id, numericality: { other_than: 1 , message: "can't be blank" }


end
