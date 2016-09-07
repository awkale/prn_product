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

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end

  def self.to_csv
    attributes = %w{recipient_name description city state category_name}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |recip|
        csv << attributes.map{|attr| recip.send(attr)}
      end
    end
  end

  def category_name
    "#{category.name}"
  end

  # def self.ransackable_attributes(auth_object = nil)
  #   ['recipient_name', 'alternate_name', 'description', 'city', 'state']
  # end
end
