FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { '3' }
    municipality { '横浜市緑区' }
    block { '青山1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
