class MediaPointProductsController < ApplicationController
  def index
    @media_point_products = MediaPointProduct.all
  end
  def new
    @media_point_product = MediaPointProduct.new
    @media_point_product.media_point_id = params[:media_point_id]
    @media_point = MediaPoint.find(params[:media_point_id])
  end

  def show
    @media_point_product = MediaPointProduct.find(params[:id])
  end

  def create
    @media_point_product = MediaPointProduct.new(media_point_product_params)
    if @media_point_product.save
      redirect_to @media_point_product.media_point
    else
      render :new
    end
  end

  def edit
    @media_point_product = MediaPointProduct.find(params[:id])
  end

  def update
    @media_point_product = MediaPointProduct.find(params[:id])

    media_point_product_params = params.require(:media_point_product).permit(:media_point_id, :product_id)
    @media_point_product.update_attributes(media_point_product_params)

    redirect_to root_path
  end

  private
  def media_point_product_params
    params.require(:media_point_product).permit(:media_point_id, :product_id)
  end
end
