require 'rails_helper'

Rspec.describe PurchaseBuyer, type: :model do
  before do
    @purchase_buyer = FactoryBot.build(:purchase_buyer)
    user_id = FactoryBot.create(:user)
    item_id = FactoryBot.create(:item)
    @purchase_buyer = FactoryBot.build(:purchase_buyer, user_id: user_id, item_id: item_id)
  end

  descride '商品購入機能' do
    context '購入できるとき' do
      it 'すべての値が規定通りに存在すれば登録できる' do
        expect(@purchase_buyer).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_buyer.building_name = ''
        expect(@purchase_buyer).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号が空だと購入できない' do
      end
      it '郵便番号にハイフン(-)がないと購入できない' do
      end
      it '都道府県が初期値だと購入できない' do
      end
      it '市町村が空だと購入できない' do
      end
      it '番地が空だと購入できない' do
      end
      it '電話番号が空だと購入できない' do
      end
      it '電話番号が12桁以上あると購入できない' do
      end
      it '電話番号が９桁以下だと購入できない' do
      end
      it 'トークンが空だと購入できない' do
      end
      it 'user_idが空だと購入できない' do
      end
      it 'item_idが空だと購入できない' do
      end
    end
  end
end

