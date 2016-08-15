class ProductLinesController < ApplicationController
  before_action :find_product_line, :only => [:show, :edit, :update, :destroy]
  include TheSortableTreeController::Rebuild
  layout 'page'

  def index
    @product_lines = ProductLine.all
  end

  def new
    @product_line = ProductLine.new
  end

  def show

  end

  def create
    if current_user.admin?
      @product_line = ProductLine.new(product_line_params)
      if @product_line.save
        redirect_to product_lines_path
      else
        render :new
      end
    else
      redirect_to product_lines_path, alert: "You do not have permission."
    end
  end

  def edit

  end

  def update
    if current_user.admin?
      if @product_line.update_attributes(product_line_params)
        redirect_to product_lines_path, notice: "Successfully updated product line"
      else
        render :edit
      end
    else
      redirect_to product_lines_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @product_line.destroy
      redirect_to product_lines_path
    else
      redirect_to product_lines_path, alert: "You do not have permission."
    end
  end

  def manage
    if current_user.admin?
      @product_lines = ProductLine.nested_set.select('id, product_line, parent_id').all
    else
      redirect_to manage_product_lines_path, alert: "You do not have permission."
    end
  end

  private
  def find_product_line
    @product_line = ProductLine.find(params[:id])
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
