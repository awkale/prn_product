class MultimediaController < ApplicationController
  before_action :find_multimedium, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @multimedia = Multimedium.all
  end

  def new
    @multimedium = Multimedium.new
  end

  def show
    @recipients = @multimedium.recipients
    if params[:search]
      @related_recipients = Recipient.search(params[:search])
      @related_recipients = @related_recipients.order(:sort_by_name).includes(:multimedia, :renderings).page(params[:page])
    elsif params[:limit]
      @related_recipients = @recipients.order(:sort_by_name).includes(:multimedia, :renderings).page(params[:page]).per(params[:limit])
    else
      @related_recipients = @recipients.order(:sort_by_name).includes(:multimedia, :renderings).page(params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if current_user.admin?
      @multimedium = Multimedium.new(multimedium_params)
      if @multimedium.save
        redirect_to multimedia_path
      else
        render :new
      end
    else
      redirect_to multimedia_path, alert: "You do not have permission."
    end
  end

  def edit
  end

  def update
    if current_user.admin?
      if @multimedium.update_attributes(multimedium_params)
        redirect_to multimedia_path, notice: "Successfully updated category."
      else
        render :edit
      end
    else
      redirect_to multimedia_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @multimedium.destroy
      redirect_to multimedia_path
    else
      redirect_to multimedia_path, alert: "You do not have permission."
    end
  end

  private
  def find_multimedium
    @multimedium = Multimedium.find(params[:id])
  end

  def multimedium_params
    params.require(:multimedium).permit(
      :media_type,
      :icon,
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
      )
  end
end
