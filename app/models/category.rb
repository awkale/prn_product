class Category < ActiveRecord::Base
  has_many :recipients
  validates :name, presence: true, uniqueness: true

  default_scope { order('name')}
end
