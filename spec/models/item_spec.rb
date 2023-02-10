require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品管理機能' do
    context '出品できる場合' do
      it 'すべての値が規定通りに存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明が空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'カテゴリーが初期値だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が初期値だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担が初期値だと出品できない' do
        @item.payee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payee can't be blank")
      end
      it '発送元の地域が初期値だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が初期値だと出品できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end
      it '販売価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が半角数字以外だと出品できない' do
        @item.price ='KKK'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で¥300~¥9,999,999の間のみ出品可能")
      end
      it '販売価格が300以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で¥300~¥9,999,999の間のみ出品可能")
      end
      it '販売価格が99999999以上だと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で¥300~¥9,999,999の間のみ出品可能")
      end
    end
  end
end
