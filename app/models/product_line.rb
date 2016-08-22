class ProductLine < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  has_many :products

  validates :product_line, presence: true, uniqueness: true

  default_scope { order('product_line')}
end
