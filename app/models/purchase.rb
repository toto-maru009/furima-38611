class Purchase < ApplicationRecord

  belongs_to :item
  has_one :buyer
  belongs_to :user

end
