class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :block, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "を入力して下さい" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, block: block,
                   building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
