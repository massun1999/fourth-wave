FactoryBot.define do
  factory :idea do
    title          {Faker::name}
    text           {Faker::Lorem.sentence}
    category_id    {2}
    format_id      {2}
    price          {2000}

    association :user

    
  end
end
