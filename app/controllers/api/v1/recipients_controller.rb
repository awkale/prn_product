class Api::V1::RecipientsController < Api::V1::BaseController
  def show
    recipient = Recipient.find(params[:id])

    render(json: Api::V1::RecipientSerializer.new(user).to_json)
  end
end
