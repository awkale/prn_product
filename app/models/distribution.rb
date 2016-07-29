class Distribution < ActiveRecord::Base
  belongs_to :product
  belongs_to :recipient

  validates :recipient_id, uniqueness: {scope: :product_id}

  # default_scope { order('product_id') }
end
