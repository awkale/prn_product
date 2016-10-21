RecipientType = GraphQL::ObjectType.define do
  name 'Recipient'
  description 'PRN recipients'
  field :recipientName, types.String, property: :recipient_name
  field :alternateName, types.String, property: :alternate_name
  field :city, types.String
  field :state, types.String
  field :country, types.String
  field :category_id, types.ID

end