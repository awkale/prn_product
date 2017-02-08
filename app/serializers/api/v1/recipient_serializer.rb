class Api::V1::RecipientSerializer < Api::V1::BaseSerializer
  attributes :id, :recipient_name, :description

  has_many :products
end