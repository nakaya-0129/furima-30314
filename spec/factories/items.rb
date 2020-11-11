FactoryBot.define do
  factory :item do
    association :user
    association :shipping_area
    association :shipping_cost
    association :ship_day
    association :category
    association :status

    name         {"foo"}
    decription   {"fuga"}
    price        {1000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
  end
end
end
