class Recipient < ActiveRecord::Base
  has_many :distributions, dependent: :destroy
  has_many :products, through: :distributions

  has_many :recipient_channels, dependent: :destroy
  has_many :channels, through: :recipient_channels

  has_many :recipient_subjects, dependent: :destroy
  has_many :subjects, through: :recipient_subjects

  has_many :recipient_industries, dependent: :destroy
  has_many :industries, through: :recipient_industries

  has_many :renderings, dependent: :destroy
  has_many :multimedia, through: :renderings

  belongs_to :category
  belongs_to :ticker

  validates :recipient_name, presence: true, uniqueness: true

  accepts_nested_attributes_for :products, reject_if: proc { |attributes| attributes['product_name'].blank? }
  # default_scope { order('sort_by_name') }

  after_validation :add_sort_name

  def add_sort_name
    self.sort_by_name = self.create_sort_name
  end

  def create_sort_name
    recipient_name.downcase.sub(/^the |^a |^an |^ /i,"")
  end

  def self.ransackable_attributes(auth_object = nil)
    ['recipient_name', 'alternate_name', 'description', 'city', 'state']
  end
end
