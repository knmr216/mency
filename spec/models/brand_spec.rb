require 'rails_helper'

RSpec.describe Brand, type: :model do
  before do
    @brand = FactoryBot.build(:brand)
  end

  describe 'ブランド新規登録' do
    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@brand).to be_valid
      end
      it 'introductionは空でも登録できる' do
        @brand.introduction = ''
        expect(@brand).to be_valid
      end
      it 'imageは空でも登録できる' do
        @brand.image = ''
        expect(@brand).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @brand.name = ''
        @brand.valid?
        expect(@brand.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @brand.email = ''
        @brand.valid?
        expect(@brand.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @brand.save
        another_brand = FactoryBot.build(:brand)
        another_brand.email = @brand.email
        another_brand.valid?
        expect(another_brand.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていなれば登録できない' do
        @brand.email = 'example.com'
        @brand.valid?
        expect(@brand.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @brand.password = ''
        @brand.valid?
        expect(@brand.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @brand.password = 'abc12'
        @brand.password_confirmation = 'abc12'
        @brand.valid?
        expect(@brand.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに半角英字が含まれなければ登録できない' do
        @brand.password = '123456'
        @brand.password_confirmation = @brand.password
        @brand.valid?
        expect(@brand.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに半角数字が含まれなければ登録できない' do
        @brand.password = 'abcdef'
        @brand.password_confirmation = @brand.password
        @brand.valid?
        expect(@brand.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpass_confirmationが空では登録できない' do
        @brand.password_confirmation = ''
        @brand.valid?
        expect(@brand.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordpassword_confirmationの値が一致しなければ登録できない' do
        @brand.password = 'abc123'
        @brand.password_confirmation = 'def456'
        @brand.valid?
        expect(@brand.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
