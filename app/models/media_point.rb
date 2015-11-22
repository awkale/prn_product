class MediaPoint < ActiveRecord::Base
  has_many :media_point_products
  has_many :products, through: :media_point_products
end
