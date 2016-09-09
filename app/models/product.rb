class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
     [
       :product_name,
       [:product_name, :code]
     ]
  end

  has_many :distributions, dependent: :destroy
  has_many :recipients, through: :distributions
  belongs_to :product_line

  validates :product_name, presence: true, uniqueness: true
  validates :base_price, numericality: true
  validates :length_price, numericality: true

  default_scope { order('product_name') }

  def self.filter_names
    ['id', 'category_id', 'alternate_name', 'description', 'country', 'created_at', 'updated_at', 'ap', 'ticker_id', 'sort_by_name', 'slug', "distributions.count", 'products.count', 'recipient_channels.count', 'channels.count', 'recipient_subjects.count', 'subjects.count', 'recipient_industries.count', 'industries.count', 'renderings.count', 'multimedia.count']
  end

end
