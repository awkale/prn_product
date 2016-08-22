class RecipientSubject < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :subject

  validates :recipient_id, uniqueness: {scope: :subject_id}
end
