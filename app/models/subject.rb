class Subject < ActiveRecord::Base
  extend FriendlyId
  friendly_id :subject_name, use: [:slugged, :finders]

  has_many :recipient_subjects, dependent: :destroy
  has_many :recipients, through: :recipient_subjects

  validates :subject_name, presence: true, uniqueness: true

  default_scope { order('subject_name')}
end
