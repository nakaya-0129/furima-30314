require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入のデータ保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存される' do
      expect(@order_address).to be_valid
    end

    it '建物の入力が空でも保存される' do
      @order_address.building = nil
      expect(@order_address).to be
    end
    
    it 'tokenが空では保存されない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では保存されない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号は-(ハイフン)を含む７桁の数字でなければ登録できない' do
      @order_address.postal_code = "p033090"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    
    it '配送先地域が未選択では保存されない' do
      @order_address.shipping_area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area Select")
    end

    it '市町村の入力が空だと保存されない' do
      @order_address.municipal = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipal can't be blank")
    end

    it '番地の入力が空だと保存されない' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空だと保存されない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号はハイフンなしの数字でしか保存されない' do
      @order_address.phone_number = "090-989-0989"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は11桁以内でなければ登録できない' do
      @order_address.phone_number = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

  end
end
