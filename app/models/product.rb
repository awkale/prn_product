class Product < ActiveRecord::Base

  has_many :media_point_products, dependent: :destroy
  has_many :media_points,
            through: :media_point_products
  validates :product_name, presence: true
  validates :base_price, numericality: true
  validates :length_price, numericality: true

  default_scope { order('product_name') }

  # accepts_nested_attributes_for :media_point_products
            # :reject_if => :all_blank,
            # :allow_destroy => true
  # accepts_nested_attributes_for :media_points
end
