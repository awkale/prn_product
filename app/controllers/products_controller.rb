class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    product_params = params.require(:product).permit(:product_name, :description, :code, :base_price, :length_price)
    @product.update_attributes(product_params)

    redirect_to product_path(id: @product.id)
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :description, :code, :base_price, :length_price)
  end

end