class RecipientIndustry < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :industry

  validates :recipient_id, uniqueness: {scope: :industry_id}
end
