class Channel < ActiveRecord::Base
  extend FriendlyId
  friendly_id :channel_name, use: :slugged

  has_many :recipient_channels, dependent: :destroy
  has_many :recipients, through: :recipient_channels

  validates :channel_name, presence: true, uniqueness: true

  default_scope { order('channel_name') }
end
