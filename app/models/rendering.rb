class Rendering < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :multimedium

  validates :recipient_id, uniqueness: {scope: :multimedium_id}

end
