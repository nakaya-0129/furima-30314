class OrderAddress

include ActiveModel::Model
attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipal, :house_number, :phone_number,:building,:token

with_options presence: true do
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shipping_area_id, numericality: { other_than: 1,message:"Select"}
  validates :municipal
  validates :house_number
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  validates :token
  validates :item_id
  validates :user_id
end

def save
  order = Order.create(user_id: user_id,item_id: item_id)
  Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipal: municipal, house_number: house_number, building: building, phone_number: phone_number,order_id: order.id)
end
end