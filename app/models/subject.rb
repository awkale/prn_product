class Subject < ActiveRecord::Base
  has_many :recipient_subjects, dependent: :destroy
  has_many :recipients, through: :recipient_subjects

  validates :subject_name, presence: true, uniqueness: true

  default_scope { order('subject_name')}
end
