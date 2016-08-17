class TickersController < ApplicationController
  before_action :find_ticker, only: [:show, :edit, :update, :destroy]
  layout 'page'
  helper_method :sort_column, :sort_direction

  def index
    @tickers = Ticker.all
  end

  def new
    @ticker = Ticker.new
  end

  def show
   params[:sort] ||= 'sort_by_name'

   @recipients = @ticker.recipients
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
      @ticker = Ticker.new(ticker_params)
      if @ticker.save
        redirect_to tickers_path
      else
        render :new
      end
    else
      redirect_to tickers_path, alert: "You do not have permission."
    end
  end

  def edit

  end

  def update
    if current_user.admin?
      if @ticker.update_attributes(ticker_params)
        redirect_to tickers_path, notice: "Successfully updated category."
      else
        render :edit
      end
    else
      redirect_to tickers_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @ticker.destroy

      redirect_to tickers_path
    else
      redirect_to tickers_path, alert: "You do not have permission."
    end
  end

  private
  def find_ticker
    @ticker = Ticker.find(params[:id])
  end

  def sort_column
    Recipient.column_names.include?(params[:sort]) ? params[:sort] : 'sort_by_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def ticker_params
    params.require(:ticker).permit(:ticker_type)
  end
end
