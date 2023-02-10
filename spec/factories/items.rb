FactoryBot.define do
  factory :item do
    association :user

    name             {Faker::Name}
    price            {Faker::Number.between(from: 300, to: 99999999)}
    explanation      {Faker::Lorem.paragraph}
    category_id      {Faker::Number.between(from: 2, to: 11)}
    status_id        {Faker::Number.between(from: 2, to: 7)}
    payee_id         {Faker::Number.between(from: 2, to: 3)}
    prefecture_id    {Faker::Number.between(from: 2, to: 48)}
    period_id        {Faker::Number.between(from: 2, to: 4)}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
  end
end
