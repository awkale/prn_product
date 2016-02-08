class MediaPointsController < ApplicationController
  def index
    @media_points = MediaPoint.all
  end

  def new
    @media_point = MediaPoint.new
    # @product = @media_point.build_product
    # @media_point_products = @product.media_point_products.build
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

    media_point_params = params.require(:media_point).permit(:media_point_name, :category, :sub_category, :city, :state, :country, :industry)
    @media_point.update_attributes(media_point_params)

    redirect_to media_point_path(id: @media_point.id)
  end

  def destroy
    @media_point = MediaPoint.find(params[:id])
    @media_point.destroy

    redirect_to media_points_path
  end

  private
  def media_point_params
    params.require(:media_point).permit(:media_point_name, :category, :sub_category, :city, :state, :country, :industry, product_attributes: [:product_name, media_point_products: [:media_point_id, :product_id]])
  end

end