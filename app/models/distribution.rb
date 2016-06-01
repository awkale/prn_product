class Distribution < ActiveRecord::Base
  belongs_to :product
  belongs_to :recipient

  default_scope { order('product_id') }
end
