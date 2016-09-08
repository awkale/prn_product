class Product < ActiveRecord::Base

  has_many :distributions, dependent: :destroy
  has_many :recipients, through: :distributions
  belongs_to :product_line

  validates :product_name, presence: true, uniqueness: true
  validates :base_price, numericality: true
  validates :length_price, numericality: true

  default_scope { order('product_name') }

  def self.to_csv
    attributes = %w{recipient_name  city state category_name}
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

end
