class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d][^A-Z]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers", length: { minimum: 6 }
         validates :email, confirmation: true, uniqueness: true
         validates :nick_name, presence: true, uniqueness: true 
         validates :surname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'}
         validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'} 
         validates :surname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:'Full-width katakana characters'}
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:'Full-width katakana character'}
         validates :birthday, presence: true

         #has_many :items
         #has_many :purchases
end
