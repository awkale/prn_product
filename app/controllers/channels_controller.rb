class ChannelsController < ApplicationController
  before_action :find_channel, :only => [:show, :edit, :update, :destroy]
  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def show
    # @recipients = @channel.recipients.page(params[:page]).per(10)
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to channels_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    channel_params = params.require(:channel).permit(:channel_name)
    @channel.update_attributes(channel_params)

    redirect_to channel_path(id: @channel.id)
  end

  def destroy
    @product.destroy

    redirect_to channels_path
  end

  private
  def find_channel
    @channel = Channel.find(params[:id])
  end
  def channel_params
    params.require(:channel).permit(:channel_name, recipient_attributes: [:recipient_name,recipient_channels: [:recipient_id, :channel_id]])
  end

end
