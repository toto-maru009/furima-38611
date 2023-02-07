class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze }
  validates :surname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/.freeze, message: '全角カタカナが必須です'}
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/.freeze, message: '全角カタカナが必須です'}
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: '半角英数字混合での入力が必須です'}
end
