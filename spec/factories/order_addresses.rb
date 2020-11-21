FactoryBot.define do
  factory :order_address do
          user_id    {1}
          item_id    {1}
          token      {"whook_7347dd2f065871c8d45e1c5d7d"}
          shipping_area_id  {2}
          postal_code    {"333-0849"}
          municipal      {"川口市"}
          house_number   {"1-1"}
          building       {"ビル"}
          phone_number   {"0482517735"}
        end
      end
