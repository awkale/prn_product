class Industry < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  has_many :recipient_industries, dependent: :destroy
  has_many :recipients, through: :recipient_industries

  validates :industry_name, presence: true, uniqueness: true

  default_scope { order('industry_name')}

  def self.ransackable_attributes(auth_object = nil)
    ['industry_name']
  end
end
