class Ticker < ActiveRecord::Base
  has_many :recipients
  validates :ticker_type, presence: true, uniqueness: true

  default_scope {order('ticker_type')}
end
