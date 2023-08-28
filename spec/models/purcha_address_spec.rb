require 'rails_helper'

RSpec.describe PurchaAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purcha_address = FactoryBot.build(:purcha_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purcha_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purcha_address.building_name = ''
        expect(@purcha_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purcha_address.post_code = ''
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purcha_address.post_code = '1234567'
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purcha_address.prefecture_id = 1
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purcha_address.city = ''
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purcha_address.address = ''
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_nameが空だと保存できないこと' do
        @purcha_address.phone_name = ''
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Phone name can't be blank")
      end
      it 'phone_nameが10桁以上11桁以内でないと保存できないこと' do
        @purcha_address.phone_name = '123456789'
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Phone name is too short (minimum is 10 characters)")
      end
      it 'phone_nameが半角数値のみしか保存できないこと' do
        @purcha_address.phone_name = '０９０１２３４５６７８'
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Phone name is not a number")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @purcha_address.user_id = nil
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが紐付いていないと保存できないこと' do
        @purcha_address.product_id = nil
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purcha_address.token = nil
        @purcha_address.valid?
        expect(@purcha_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
