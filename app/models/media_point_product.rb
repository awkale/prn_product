class MediaPointProduct < ActiveRecord::Base

  belongs_to :media_point
  belongs_to :product

  # accepts_nested_attributes_for :product,
  #                               :reject_if => :all_blank
  # accepts_nested_attributes_for :media_point,
                                # :reject_if => :all_blank
end
