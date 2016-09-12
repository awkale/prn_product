class RecipientsController < ApplicationController
  before_action :find_recipient, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @search = Recipient.ransack(params[:q])
    @search.sorts = 'sort_by_name asc' if @search.sorts.empty?
    @csv_recipients = @search.result(distinct: true).includes(:category, :multimedia)
    @recipients = @csv_recipients.page(params[:page]).per(params[:limit])

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"recipients-#{Date.today}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def new
    @recipient = Recipient.new
  end

  def show
  end

  def create
    if current_user.admin?
      @recipient = Recipient.new(recipient_params)
      if @recipient.save
        redirect_to recipients_path, notice: "Successfully created recipient."
      else
        render :new
      end
    else
      redirect_to recipients_path, alert: "You do not have permission."
    end
  end

  def edit
  end

  def update
    if current_user.admin?
      if @recipient.update_attributes(recipient_params)
        redirect_to recipient_path(id: @recipient.id), notice: "Successfully updated recipient."
      else
        render :edit
      end
    else
      redirect_to recipients_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @recipient.destroy

      redirect_to recipients_path, notice: "Successfully deleted recipient."
    else
      redirect_to recipients_path, alert: "You do not have permission."
    end
  end

  private
  def find_recipient
    @recipient = Recipient.friendly.find(params[:id])
  end

  def build_csv
    CSV.generate do |csv|
      csv << Recipient.csv_columns
      @csv_recipients.each { |record| csv << record.to_csv }
    end
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
      :ap,
      :ticker_id,
      subject_ids: [],
      subject_attributes: [
        :id,
        :subject_name],
      category_attributes: [
        :id,
        :name],
      ticker_attributes: [
        :id,
        :ticker_type],
      product_ids: [],
      product_attributes: [
        :id,
        :product_name],
      channel_ids: [],
      channel_attributes: [
        :id,
        :channel_name],
      industry_ids: [],
      industry_attributes: [
        :id,
        :industry_name],
      multimedium_ids: [],
      multimedium_attributes: [
        :id,
        :media_type],
    )
  end


end
