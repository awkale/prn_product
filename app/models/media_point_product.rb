class MediaPointProduct < ActiveRecord::Base

  belongs_to :media_point
  belongs_to :product

  # accepts_nested_attributes_for :product,
  #                               :allow_destroy => true
  # accepts_nested_attributes_for :media_point,
  #                               :allow_destroy => true
end
