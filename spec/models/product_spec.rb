require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    it '全て存在すれば登録できる' do
      expect(@product).to be_valid
    end
    it 'imageが空では登録できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it 'product_nameが空では登録できない' do
      @product.product_name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Product name can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @product.description = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが空では登録できない' do
      @product.category_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが空では登録できない' do
      @product.condition_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Condition can't be blank")
    end
    it 'cost_idが空では登録できない' do
      @product.cost_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Cost can't be blank")
    end
    it 'prefecture_idが空では登録できない' do
      @product.prefecture_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'delivery_day_idが空では登録できない' do
      @product.delivery_day_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery day can't be blank")
    end
    it 'priceが空では登録できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300円より少ない時は登録できない' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it 'priceが9999999円より多い時は登録できない' do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'priceが半角数値でないと登録できない' do
      @product.price = 'a'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
  end
end
