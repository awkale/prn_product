class ProductLinesController < ApplicationController
  before_action :find_product_line, :only => [:show, :edit, :update, :destroy]
  include TheSortableTreeController::Rebuild
  layout 'page'

  def index
    @product_lines = ProductLine.all
    authorize ProductLine
  end

  def new
    @product_line = ProductLine.new
    authorize @product_line
  end

  def show
    @related_products = @product_line.products
    @search = @related_products.ransack(params[:q])
    @search.sorts = 'product_name asc' if @search.sorts.empty?
    @related_products = @search.result(distinct: true)
                         .page(params[:page]).per(params[:limit])
  end

  def create
      @product_line = ProductLine.new(product_line_params)
      if @product_line.save
        redirect_to product_lines_path
      else
        render :new
      end
  end

  def edit

  end

  def update
      if @product_line.update_attributes(product_line_params)
        redirect_to product_lines_path, notice: "Successfully updated product line"
      else
        render :edit
      end
  end

  def destroy
      @product_line.destroy
      redirect_to product_lines_path
  end

  def manage
      @product_lines = ProductLine.nested_set.select('slug, product_line, parent_id').all
  end

  private
  def find_product_line
    @product_line = ProductLine.friendly.find(params[:id])
    authorize @product_line
  end

  def product_line_params
    params.require(:product_line).permit(
      :product_line,
      :parent_id,
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
      )
  end

end
