class ChannelsController < ApplicationController
  before_action :find_channel, :only => [:show, :edit, :update, :destroy]
  layout 'page'
  helper_method :sort_column, :sort_direction

  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def show
    params[:sort] ||= 'sort_by_name'
    @recipients = @channel.recipients
    if params[:limit]
      @related_recipients = @recipients.order(sort_column + ' ' + sort_direction).includes(:multimedia, :renderings).page(params[:page]).per(params[:limit])
    else
      @related_recipients = @recipients.order(sort_column + ' ' + sort_direction).includes(:multimedia, :renderings).page(params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if current_user.admin?
      @channel = Channel.new(channel_params)
      if @channel.save
        redirect_to channels_path
      else
        render :new
      end
    else
      redirect_to channels_path, alert: "You do not have permission."
    end
  end

  def edit
  end

  def update
    if current_user.admin?
      if @channel.update_attributes(channel_params)
        redirect_to channel_path(id: @channel.id), notice: "Successfully updated channel."
      else
        render :edit
      end
    else
      redirect_to channels_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @channel.destroy

      redirect_to channels_path
    else
      redirect_to channels_path, alert: "You do not have permission."
    end
  end

  private
  def find_channel
    @channel = Channel.find(params[:id])
  end

  def sort_column
    Recipient.column_names.include?(params[:sort]) ? params[:sort] : 'sort_by_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def channel_params
    params.require(:channel).permit(
      :channel_name,
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
        )
  end

end
