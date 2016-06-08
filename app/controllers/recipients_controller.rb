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
      redirect_to recipients_path, notice: "Successfully created recipient."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipient.update_attributes(recipient_params)
      redirect_to recipient_path(id: @recipient.id), notice: "Successfully updated recipient."
    else
      render :edit
    end
  end

  def destroy
    @recipient.destroy

    redirect_to recipients_path, notice: "Successfully deleted recipient."
  end

  private
  def find_recipient
    @recipient = Recipient.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(
      :recipient_name,
      :alternate_name,
      :description,
      :city,
      :state,
      :country,
      :category_id,
      subject_ids: [],
      subject_attributes: [
        :id,
        :subject_name],
      category_attributes: [
        :id,
        :name],
      product_ids: [],
      product_attributes: [
        :id,
        :product_name],
      channel_ids: [],
      channel_attributes: [
        :id,
        :channel_name]
    )
  end


end
