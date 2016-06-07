class RecipientsController < ApplicationController
  before_action :find_recipient, :only => [:show, :edit, :update, :destroy]

  def index
    @recipients = Recipient.order(:recipient_name).page(params[:page])
  end

  def new
    @recipient = Recipient.new
  end

  def show
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
  end

  def update

    @recipient.update_attributes(recipient_params)

    redirect_to recipient_path(id: @recipient.id)
  end

  def destroy
    @recipient.destroy

    redirect_to recipients_path
  end

  private
  def find_recipient
    @recipient = Recipient.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:recipient_name, :alternate_name, :description, :city, :state, :country, :category_id, category_attributes: [:category_id,:name], product_attributes: [:product_name, recipient_products: [:recipient_id, :product_id]], channel_attributes: [:channel_name, recipient_channels: [:recipient_id, :channel_id]])
  end


end
