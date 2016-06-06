class Category < ActiveRecord::Base
  has_many :recipients

  default_scope { order('category')}
end
