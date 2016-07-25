class Rendering < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :multimedium

  validates_uniqueness_of :recipient_id, :scope => :multimedium_id
end
