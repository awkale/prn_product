class Channel < ActiveRecord::Base
  has_many :media_point_channels, dependent: :destroy

  has_many :media_points, through: :media_point_channels

  default_scope { order('channel_name') }
end
