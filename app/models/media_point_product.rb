class MediaPointProduct < ActiveRecord::Base
  belongs_to :media_point
  belongs_to :product
end
