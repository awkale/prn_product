class Product < ActiveRecord::Base

  has_many :media_point_products
  has_many :media_points,
            through: :media_point_products

  accepts_nested_attributes_for :media_point_products
            # :reject_if => :all_blank,
            # :allow_destroy => true
  # accepts_nested_attributes_for :media_points
end
