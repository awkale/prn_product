class RecipientChannel < ActiveRecord::Base
  belongs_to :channel
  belongs_to :recipient
end
