
##  products table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|condition|string|null:false|
|delivery_fee|integer|null:false|
|shipping_area|string|null:false|
|shipping_days|integer|null:false| 
|price|integer|null:false|
|user_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|

### Association
- has_many :product_images
- belongs_to :brand
- belongs_to :category
- belongs_to :user


##  product_images table
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product


## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|

### Association
- has_many :products


##  brands table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


##  users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null: false, uniqueness: true|
|password|string|null: false, uniqueness: true|
|last_name|string|null: false|
|first_name|string|null: false|
|ruby_last_name|string|null:false|
|ruby_first_name|string|null:false|
|birthdate|date|null:false|

### Association
- has_many :products
- has_one :credit_card
- has_one :shipping_address


## shipping_address table
|Column|Type|Options|
|------|----|-------|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|postal_code|integer|null: false| 
|prefectures|string|null: false|
|city|string|null: false|
|address_detail|string|null: false|
|building_name|string|
|room_number|string|
|phone_number|string|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## credit-cards table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|references|null: false, foreign_key: true|
|card_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user