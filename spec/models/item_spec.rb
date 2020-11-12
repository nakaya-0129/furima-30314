require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe 'ユーザー商品出品機能' do
  context '商品出品がうまくいくとき' do
    it '商品画像と商品名と商品説明、価格とuser_idが存在していて、商品のカテゴリー、状態、配送料の負担、発送元の地域、発送までの日数が選択されていれば出品できる' do
      expect(@item).to be_valid
    end
  end 
context '商品品出品ができないとき'
it '出品画像が空だと出品できない' do
  @item.image = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Image can't be blank")
end
it '商品名が空だと出品できない' do
  @item.name = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("Name can't be blank")
  end
it '商品説明が空だと出品できない' do
  @item.decription = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("Decription can't be blank")
end
it '商品価格が空だと出品できない' do
  @item.price = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank")
end
it '商品価格が300円未満では出品できない' do
  @item.price = 200
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Out of setting range")
end
it '商品価格が10,000,000円以上では出品できない' do
  @item.price = 10000000
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Out of setting range")
end
it '商品価格に文字は入力できない' do
  @item.price = "foo300"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Out of setting range")
end
it '商品のカテゴリーが未選択では出品できない' do
  @item.category_id = 1
  @item.valid? 
  expect(@item.errors.full_messages).to include("Category Select")
end
it '商品の状態が未選択では出品できない' do
  @item.status_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Status Select")
end
it '配送料の負担が未選択では出品できない' do
  @item.shipping_cost_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipping cost Select")
end
it '発送元の地域が未選択では出品できない' do
  @item.shipping_area_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipping area Select")
end
it '発送までの日数が未選択では出品できない' do
  @item.ship_day_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Ship day Select")
end
end
end
