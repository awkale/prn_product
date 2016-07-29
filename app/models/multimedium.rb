class Multimedium < ActiveRecord::Base
  has_many :renderings, dependent: :destroy
  has_many :recipients, through: :renderings

  validates :media_type, presence: true, uniqueness: true

  default_scope {order('media_type')}
end
