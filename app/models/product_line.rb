class ProductLine < ActiveRecord::Base
  extend FriendlyId
  friendly_id :product_line, use: [:slugged, :finders]

  acts_as_nested_set
  include TheSortableTree::Scopes

  has_many :products

  validates :product_line, presence: true, uniqueness: true

  default_scope { order('product_line')}
end
