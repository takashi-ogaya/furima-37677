FactoryBot.define do
  factory :item do
    trade_name { '商品名' }
    detail { '商品の説明' }
    category_id { '2' }
    condition_id { '3' }
    postage_id { '3' }
    prefecture_id { '10' }
    shipping_days_id { '3' }
    price { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
