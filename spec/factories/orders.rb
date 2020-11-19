FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    price {3000}

    association :user
    association :idea
  end
end
