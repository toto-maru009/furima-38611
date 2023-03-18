FactoryBot.define do
  factory :purchase_buyer do
    postal_code {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)}
    municipality {Faker::Address.city}
    address {Faker::Address.street_address}
    building_name {Faker::Address.street_address}
    telephone_number {Faker::Number.decimal_part(digits: 11)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    token {Faker::Internet.password(min_length: 20, max_length: 30)}

    association :user
    association :item
    
  end
end
