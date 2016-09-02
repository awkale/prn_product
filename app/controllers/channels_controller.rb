class ChannelsController < ApplicationController
  before_action :find_channel, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def show
    @related_recipients = @channel.recipients
    @search = @related_recipients.ransack(params[:q])
    @search.sorts = 'sort_by_name asc' if @search.sorts.empty?
    @related_recipients = @search.result(distinct: true)
                         .includes(:category, :multimedia)
                         .page(params[:page]).per(params[:limit])
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
