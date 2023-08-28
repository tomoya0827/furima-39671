FactoryBot.define do
  factory :purcha_address do
    product_id {1}
    user_id {1}
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '京都市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_name { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
