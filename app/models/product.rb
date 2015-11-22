class Product < ActiveRecord::Base
  has_many :media_point_products
  has_many :media_points, through: :media_point_products
end
