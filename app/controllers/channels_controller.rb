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
    @recipients = @channel.recipients
    @related_recipients = Kaminari.paginate_array(@recipients.all.sort_by{|t| t.recipient_name.downcase.sub(/^the |a |an /i,"")}).page(params[:page])
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
