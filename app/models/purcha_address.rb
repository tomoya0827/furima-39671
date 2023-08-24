class PurchaAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_name, :purchase_record, :product_id, :user_id

  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)

    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,building_name: building_name,
      phone_name: phone_name, purchase_record: purchase_record, product_id: product_id)
  end
end