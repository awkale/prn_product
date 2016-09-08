class Ticker < ActiveRecord::Base
  extend FriendlyId
  friendly_id :ticker_type, use: :slugged

  has_many :recipients
  validates :ticker_type, presence: true, uniqueness: true

  default_scope {order('ticker_type')}
end
