class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def show
    @channel = Channel.find(params[:id])
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
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])

    channel_params = params.require(:channel).permit(:channel_name)
    @channel.update_attributes(channel_params)

    redirect_to channel_path(id: @channel.id)
  end

  def destroy
    @channel = Channel.find(params[:id])
    @product.destroy

    redirect_to channels_path
  end

  private
  def channel_params
    params.require(:channel).permit(:channel_name)
  end

end
