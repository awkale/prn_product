class MediaPointChannel < ActiveRecord::Base
  belongs_to :media_point
  belongs_to :channel
end
