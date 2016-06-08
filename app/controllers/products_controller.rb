class ProductsController < ApplicationController
  before_action :find_product, :only => [:show, :edit, :update, :destroy]

  def index
    @products = Product.order(:product_name).page(params[:page])
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Successfully created product."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(id: @product.id), notice: "Successfully updated product."
    else
      render :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: "Successfully deleted product."
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :product_name,
      :description,
      :code,
      :base_price,
      :length_price,
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
    )
  end

end