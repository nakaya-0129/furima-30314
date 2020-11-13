FactoryBot.define do
  factory :item do
    association :user
    name              {"foo"}
    decription        {"fuga"}
    price             {1000}
    status_id         {2}
    category_id       {2}
    shipping_cost_id  {2}
    shipping_area_id  {2}
    ship_day_id       {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
end
end
