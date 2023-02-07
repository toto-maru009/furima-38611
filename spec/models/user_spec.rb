require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it 'すべての値が規定通りに存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassworf_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '000kk'
      @user.password_confirmation = '000kk'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordが半角英数字混合じゃないと登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合での入力が必須です")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'kkkkkk'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合での入力が必須です")
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'KKKKKK'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合での入力が必須です")
    end
    it 'surnameが空だと登録できない' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end
    it 'firstname空だと登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'surnameは全角(漢字、ひらがな、カタカナ)以外では登録できない' do
      @user.surname = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid")
    end
    it 'firstnameは全角(漢字、ひらがな、カタカナ)以外では登録できない' do
      @user.firstname = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end
    it 'surname_kanaが空だと登録できない' do
      @user.surname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank")
    end
    it 'firstname_kanaが空だと登録できない' do
      @user.firstname_kana =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it 'surname_kanaは全角(カタカナ)以外では登録できない' do
      @user.surname_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana 全角カタカナが必須です")
    end
    it 'firstname_kanaは全角(カタカナ)以外では登録できない' do
      @user.firstname_kana ='たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana 全角カタカナが必須です")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end
