require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nick_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nick_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "surnameが空だと登録できない" do
      user = FactoryBot.build(:user)
      surname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Surname can't be blank")
    end
    it "first_nameが空だと登録できない" do
     user = FactoryBot.build(:user)
     first_name = ""
     user.valid?
     expect(user.errors.full_messages).to include("First_name can't be blank")
    end
    it "surname_kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      surname_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Surname_kana can't be blank")
    end

  end
  end
