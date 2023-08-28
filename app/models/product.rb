class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
             numericality: { only_integer: true,greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 }
  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }

end
