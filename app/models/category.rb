class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :recipients
  validates :name, presence: true, uniqueness: true

  default_scope { order('name')}

  # def self.ransackable_attributes(auth_object = nil)
  #   ['name']
  # end
end
