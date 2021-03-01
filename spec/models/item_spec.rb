require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '登録できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'category_idが0では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'capacityが空では登録できない' do
        @item.capacity = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Capacity can't be blank")
      end
      it 'capacityが半角数字のみでなければ登録できない' do
        @item.capacity = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Capacity is not a number")
      end
      it 'unit_idが0では登録できない' do
        @item.unit_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Unit must be other than 0')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字のみでなければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
