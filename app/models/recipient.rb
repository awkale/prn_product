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

  validates :recipient_name, presence: true
  validates_uniqueness_of :recipient_name

  accepts_nested_attributes_for :products, reject_if: proc { |attributes| attributes['product_name'].blank? }
  # default_scope { order('recipient_name') }

  def self.search(search)
    where("recipient_name ilike ? OR alternate_name ilike ?", "%#{search}%", "%#{search}%")
  end
end
