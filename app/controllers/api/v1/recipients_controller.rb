class Api::V1::RecipientsController < Api::V1::BaseController
  include ActiveHashRelation

  def index
    recipients = Recipient.all

    recipients = apply_filters(recipients, params)

    render(
      json: ActiveModel::ArraySerializer.new(
        recipients,
        each_serializer: Api::V1::RecipientSerializer,
        root: 'recipients',
      )
    )
  end

  def show
    recipient = Recipient.find(params[:id])

    render(json: Api::V1::RecipientSerializer.new(recipient).to_json)
  end
end
