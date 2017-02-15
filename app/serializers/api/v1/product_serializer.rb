class Api::V1::ProductSerializer < Api::V1::BaseSerializer
  attributes :id, :product_name, :description

  has_many :recipients
end