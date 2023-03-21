require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  before do
    item_id = FactoryBot.create(:item)
    user_id = FactoryBot.create(:user)
    @purchase_buyer = FactoryBot.build(:purchase_buyer, user_id: user_id, item_id: item_id)
  end
  describe '購入管理機能' do
    context '商品が購入できるとき' do
      it 'すべての値が規定通りに存在すれば購入できる' do
        expect(@purchase_buyer).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_buyer.building_name = ''
        expect(@purchase_buyer).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it '郵便番号が空だと購入できない' do
        @purchase_buyer.postal_code = ''
        @purchase_buyer.valid? 
        expect(@purchase_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン(-)がないと購入できない' do
        @purchase_buyer.postal_code = 1_234_567
        @purchase_buyer.valid? 
        expect(@purchase_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が初期値だと購入できない' do
        @purchase_buyer.prefecture_id = 1
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空だと購入できない' do
        @purchase_buyer.municipality = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと購入できない' do
        @purchase_buyer.address = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @purchase_buyer.telephone_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が12桁以上あると購入できない' do
        @purchase_buyer.telephone_number = 12_345_678_912_345
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Telephone number 10桁以上11桁以内の半角数値のみ")
      end
      it '電話番号が9桁以下では購入できない' do
        @purchase_buyer.telephone_number = 12_345_678
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Telephone number 10桁以上11桁以内の半角数値のみ")
      end
      it '電話番号にハイフン(-)があると購入できない' do
        @purchase_buyer.telephone_number = '123-4567-5678'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Telephone number 10桁以上11桁以内の半角数値のみ")
      end
      it 'user_idが空だと購入できない' do
        @purchase_buyer.user_id = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itme_idが空だと購入できない' do
        @purchase_buyer.item_id = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @purchase_buyer.token = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
