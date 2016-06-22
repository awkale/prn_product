class Distribution < ActiveRecord::Base
  belongs_to :product
  belongs_to :recipient

  validates_uniqueness_of :recipient_id, :scope => :product_id

  # default_scope { order('product_id') }
end
