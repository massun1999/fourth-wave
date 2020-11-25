FactoryBot.define do
  factory :idea do
    title          {Faker::name}
    text           {Faker::Lorem.sentence}
    category_id    {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'tst_image.png')
    end
  end
end
