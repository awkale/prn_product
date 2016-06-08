class Recipient < ActiveRecord::Base
  has_many :distributions, dependent: :destroy
  has_many :products, through: :distributions
  validates :recipient_name, presence: true

  has_many :recipient_channels, dependent: :destroy
  has_many :channels, through: :recipient_channels

  has_many :recipient_subjects, dependent: :destroy
  has_many :subjects, through: :recipient_subjects

  belongs_to :category

  accepts_nested_attributes_for :products, reject_if: proc { |attributes| attributes['product_name'].blank? }
  default_scope { order('recipient_name') }
end
