require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nick_nameが空だと登録できない" do
      @user.nick_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "すでに使用されているemailアドレスは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "@を含まないemailアドレスは登録できない" do
      @user.email = "kikuko"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank","Password Include both letters and numbers")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "password:半角英数混合（半角英語のみ）" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "password:半角英数混合、数字だけでは登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "password:半角英数字混合全角では登録できない" do
      @user.password = "Foooooo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "surnameが空だと登録できない" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank","Surname Full-width characters")
    end

    it "surnameは全角漢字か平仮名しか登録できない" do
      @user.surname = "foo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname Full-width characters")
    end

    it "first_nameが空だと登録できない" do
     @user.first_name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include("First name can't be blank","First name Full-width characters" )
    end

    it "first_nameは全角漢字か平仮名しか登録できない" do
      @user.first_name = "foga"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "surname_kanaが空だと登録できない" do
      @user.surname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank","Surname kana Full-width katakana characters")
    end

    it "surname_kanaは全角片仮名以外では登録できない" do
      @user.surname_kana = "foo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana Full-width katakana characters")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank","First name kana Full-width katakana character")
    end

    it "first_name_kanaは全角片仮名以外では登録できない" do
      @user.first_name_kana = "fuga"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana character")
    end

    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
  end
