FactoryBot.define do
  factory :user do
    nick_name               {"kou"}
    email                   {"ko@0129"}
    password                {"ko0302"}
    password_confirmation   {password}
    surname                 {"菊"}
    first_name              {"甲"}
    surname_kama            {"きく"}
    first_name_kana         {"こう"}
    birthday                {"1984/01/29"}
  end
end