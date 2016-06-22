class Product < ActiveRecord::Base

  has_many :distributions, dependent: :destroy
  has_many :recipients, through: :distributions

  validates :product_name, presence: true
  validates :base_price, numericality: true
  validates :length_price, numericality: true
  validates_uniqueness_of :product_name

  default_scope { order('product_name') }

end
