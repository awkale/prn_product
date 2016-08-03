class RecipientChannel < ActiveRecord::Base
  belongs_to :channel
  belongs_to :recipient

  validates :recipient_id, uniqueness: {scope: :channel_id}
end
