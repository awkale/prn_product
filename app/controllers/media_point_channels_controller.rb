class MediaPointChannelsController < ApplicationController
  def index
    @media_point_channels = MediaPointChannel.all
  end

  def new

  end

  private
  def media_point_channel_params
    params.require(:media_point_channel).permit(:media_point_id, :channel_id)
  end
end
