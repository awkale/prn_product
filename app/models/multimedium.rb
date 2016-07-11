class Multimedium < ActiveRecord::Base
  has_many :renderings, dependent: :destroy
  has_many :recipients, through: :renderings

  validates :media_type, presence: true
  validates_uniqueness_of :media_type

  default_scope {order('media_type')}
end
