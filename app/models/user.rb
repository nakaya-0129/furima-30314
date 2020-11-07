class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable ,:validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         validates :password, format: {with: PASSWORD_REGEX ,message: "Include both letters and numbers"}, length: { minimum: 6 }
         validates :email, uniqueness: {message:'has already been taken'}, confirmation: true

        with_options presence: true do
           validates :nick_name, uniqueness: true 
           validates :birthday
         with_options format: {with:/\A[ぁ-んァ-ン一-龥]/,message:'Full-width characters'} do
           validates :surname
           validates :first_name
         end
          with_options format: {with: /\A[ァ-ヶー－]+\z/,message:'Full-width katakana characters'} do
           validates :surname_kana
           validates :first_name_kana
         end
        end
end
