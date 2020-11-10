class Item < ApplicationRecord

  belongs_to :user 
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :decription
    validates :price
    validates :user
  end

extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :cost
 belongs_to :area
 belongs_to :days
 belongs_to :status

 with_options presence: true, numericality: { other_than: 1 }  do
  validates :status_id
  validates :category_id
  validates :shipping_cost_id
  validates :ship_day_id
  validates :shipping_area_id
 end
end
