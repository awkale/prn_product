class RecipientsController < ApplicationController
  def index
    @recipients = Recipient.order(:recipient_name).page(params[:page])
  end

  def new
    @recipient = Recipient.new
  end

  def show
    @recipient = Recipient.find(params[:id])
  end

  def create
    @recipient = Recipient.new(recipient_params)
    if @recipient.save
      redirect_to recipients_path
    else
      render :new
    end
  end

  def edit
    @recipient = Recipient.find(params[:id])
  end

  def update
    @recipient = Recipient.find(params[:id])

    recipient_params = params.require(:recipient).permit(:recipient_name, :alternate_name, :category, :description, :city, :state, :country)
    @recipient.update_attributes(recipient_params)

    redirect_to recipient_path(id: @recipient.id)
  end

  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy

    redirect_to recipients_path
  end

  private
  def recipient_params
    params.require(:recipient).permit(:recipient_name, :alternate_name, :description, :city, :state, :country, product_attributes: [:product_name, recipient_products: [:recipient_id, :product_id]], channel_attributes: [:channel_name, recipient_channels: [:recipient_id, :channel_id]], category_attributes: [:category, :category_id])
  end


end
