class Category < ActiveRecord::Base
  has_many :recipients
  validates :name, presence: true
  validates_uniqueness_of :name

  default_scope { order('name')}
end
