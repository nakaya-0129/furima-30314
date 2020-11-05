FactoryBot.define do
  factory :user do
    nick_name               {"kou"}
    email                   {"ko@0129"}
    password                {"ko0908"}
    password_confirmation   {password}
    surname                 {"菊"}
    first_name              {"甲"}
    surname_kana            {"キク"}
    first_name_kana         {"コウ"}
    birthday                {"1984/01/29"}
  end
end