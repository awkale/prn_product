class RecipientIndustry < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :industry
end
