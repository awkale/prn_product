class Product < ActiveRecord::Base

  has_many :distributions, dependent: :destroy
  has_many :recipients, through: :distributions

  validates :product_name, presence: true, uniqueness: true
  validates :base_price, numericality: true
  validates :length_price, numericality: true

  default_scope { order('product_name') }

end
