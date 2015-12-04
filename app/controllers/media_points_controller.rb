class MediaPointsController < ApplicationController
  def index
    @media_points = MediaPoint.all
  end

  def new
    @media_point = MediaPoint.new
  end

  def show
    @media_point = MediaPoint.find(params[:id])
  end

  def create
    @media_point = MediaPoint.new(media_point_params)
    if @media_point.save
      redirect_to media_points_path
    else
      render :new
    end
  end

  def edit
    @media_point = MediaPoint.find(params[:id])
  end

  def update
    @media_point = MediaPoint.find(params[:id])

    media_point_params = params.require(:media_point).permit(:name, :category, :sub_category, :city, :country, :industry)
    @media_point.update_attributes(media_point_params)

    redirect_to media_point_path(id: @media_point.id)
  end

  private
  def media_point_params
    params.require(:media_point).permit(:name, :category, :sub_category, :city, :country, :industry)
  end

end