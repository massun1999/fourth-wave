FactoryBot.define do
  factory :user do
    nickname                  {Faker::Name.initials(number: 2)}
    email                     {Faker::Internet.free_email}
    password                  {"yamada628"}
    password_confirmation     {password}
    first_name                {"やマ田"}
    last_name                 {"太ロう"}
    first_ruby                {"ヤマダ"}
    last_ruby                 {"タロウ"}
    birthday                  {"1999-06-28"}
  end
end