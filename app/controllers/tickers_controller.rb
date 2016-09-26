class TickersController < ApplicationController
  before_action :find_ticker, only: [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @tickers = Ticker.all
    authorize Ticker
  end

  def new
    @ticker = Ticker.new
    authorize @ticker
  end

  def show
   @related_recipients = @ticker.recipients
   @search = @related_recipients.ransack(params[:q])
   @search.sorts = 'sort_by_name asc' if @search.sorts.empty?
   @related_recipients = @search.result(distinct: true)
                        .includes(:category, :multimedia)
                        .page(params[:page]).per(params[:limit])
  end

  def create
      @ticker = Ticker.new(ticker_params)
      if @ticker.save
        redirect_to tickers_path
      else
        render :new
      end
  end

  def edit

  end

  def update
      if @ticker.update_attributes(ticker_params)
        redirect_to tickers_path, notice: "Successfully updated category."
      else
        render :edit
      end
  end

  def destroy
      @ticker.destroy

      redirect_to tickers_path
  end

  private
  def find_ticker
    @ticker = Ticker.friendly.find(params[:id])
    authorize @ticker
  end

  def ticker_params
    params.require(:ticker).permit(:ticker_type)
  end
end
