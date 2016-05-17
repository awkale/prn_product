class Recipient < ActiveRecord::Base
  has_many :distributions, dependent: :destroy
  has_many :products, through: :distributions
  validates :recipient_name, presence: true

  has_many :recipient_channels, dependent: :destroy
  has_many :channels, through: :recipient_channels

  default_scope { order('recipient_name') }
end
