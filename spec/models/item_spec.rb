require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe 'ユーザー商品出品機能' do
  context '商品出品がうまくいくとき' do
    it '商品画像と商品名と商品説明、価格とuser_idが存在すれば出品できる' do
      expect(@item).to be_valid
    end 
  end 
end
end
