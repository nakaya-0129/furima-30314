class Item < ApplicationRecord

  belongs_to :user 
  has_one :order
  has_one_attached :image, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :decription
    validates :price,format:{with: /\A[0-9０-９][^a-zA-Z]+\z/,message:" Half-width number"},numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999,message:"Out of setting range"}
    validates :user
    validates :image
  end


extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :shipping_cost
 belongs_to :shipping_area
 belongs_to :ship_day
 belongs_to :status

 with_options presence: true, numericality: { other_than: 1 ,message:"Select"} do
  validates :status_id
  validates :category_id
  validates :shipping_cost_id
  validates :ship_day_id
  validates :shipping_area_id
 end
end
