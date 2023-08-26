class PurchaAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_name, :product_id, :user_id

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_name, length: { in: 10..11 }, numericality: { only_integer: true }
    
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)

    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,building_name: building_name,
      phone_name: phone_name, purchase_record_id: purchase_record.id)
  end
end