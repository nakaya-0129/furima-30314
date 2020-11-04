class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers' 
         validates :nick_name, presence: true, uniqueness: true 
         validates :surname, presence: true, format: {with: /\A[一-龥ぁ-ん]/, message: 'Surname Full-width characters'}
         validates :first_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/, message: 'First name Full-width characters'} 
         validates :surname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:'surname kana Full-width katakana characters'}
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:'First name kana Full-width katakana character'}
         validates :birthday, presence: true

         #has_many :items
         #has_many :purchases
end
