class Distribution < ActiveRecord::Base
  belongs_to :product
  belongs_to :recipient
end
