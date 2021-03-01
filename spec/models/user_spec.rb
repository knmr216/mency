require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'introductionは空でも登録できる' do
        @user.introduction = ''
        expect(@user).to be_valid
      end
      it 'imageは空でも登録できる' do
        @user.image = ''
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'usernameが空では登録できない' do
        @user.username = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Username can't be blank")
      end
      it '重複したusernameが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.username = @user.username
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Username has already been taken')
      end
      it 'usernameが3文字以下では登録できない' do
        @user.username = 'tar'
        @user.valid?
        expect(@user.errors.full_messages).to include("Username is invalid")
      end
      it 'usernameの先頭が_では登録できない' do
        @user.username = '_taro_yamada_'
        @user.valid?
        expect(@user.errors.full_messages).to include("Username is invalid")
      end
      it 'usernameに半角英数字と_以外の文字が含まれていれば登録できない' do
        @user.username = 'taro.yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Username is invalid")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていなれば登録できない' do
        @user.email = 'example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに半角英字が含まれなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに半角数字が含まれなければ登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpass_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordpassword_confirmationの値が一致しなければ登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'def456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
