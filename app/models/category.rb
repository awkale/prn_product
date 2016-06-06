class Category < ActiveRecord::Base
  has_many :recipients
  validates :category, presence: true

  default_scope { order('category')}
end
