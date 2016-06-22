class Subject < ActiveRecord::Base
  has_many :recipient_subjects, dependent: :destroy
  has_many :recipients, through: :recipient_subjects

  validates :subject_name, presence: true
  validates_uniqueness_of :subject_name

  default_scope { order('subject_name')}
end
