FactoryBot.define do
  factory :user do
    nick_name               {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    surname                 {"菊"}
    first_name              {"甲"}
    surname_kana            {"キク"}
    first_name_kana         {"コウ"}
    birthday                {"1984/01/29"}
  end
end