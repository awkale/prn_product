class MediaPoint < ActiveRecord::Base

  has_many :media_point_products, dependent: :destroy
  has_many :products,
            through: :media_point_products
  validates :media_point_name, presence: true

  default_scope { order('media_point_name') }
  # accepts_nested_attributes_for :media_point_products
                                # :reject_if => :all_blank,
                                # :allow_destroy => true
  # accepts_nested_attributes_for :products
end
