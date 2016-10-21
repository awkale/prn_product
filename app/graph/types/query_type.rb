QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  # field :node, :field => NodeIdentification.field

  field :recipient do
    type RecipientType
    argument :id, types.ID
    resolve -> (obj, args, ctx) {
      Recipient.find(args[:id])
    }
  end
end