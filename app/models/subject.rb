class Subject < ActiveRecord::Base
  has_many :recipient_subjects, dependent: :destroy
  has_many :recipients, through: :recipient_subjects

  default_scope { order('subject_name')}
end
