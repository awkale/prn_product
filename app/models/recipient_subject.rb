class RecipientSubject < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :subject
end
