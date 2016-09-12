class ProductsController < ApplicationController
  before_action :find_product, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @search = Product.ransack(params[:q])
    @search.sorts = 'product_name asc' if @search.sorts.empty?
    @products = @search.result(distinct: true)
                       .includes(:product_line)
                       .page(params[:page]).per(params[:limit])
  end

  def new
    @product = Product.new
  end

  def show
    @related_recipients = @product.recipients
    @search = @related_recipients.ransack(params[:q])
    @search.sorts = 'sort_by_name asc' if @search.sorts.empty?
    @csv_related_recipients = @search.result(distinct: true).includes(:category, :multimedia)
    @related_recipients = @csv_related_recipients.page(params[:page]).per(params[:limit])

    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"#{@product.product_name}-recipients-#{Date.today}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def create
    if current_user.admin?
      @product = Product.new(product_params)
      if @product.save
        redirect_to products_path, notice: "Successfully created product."
      else
        render :new
      end
    else
      redirect_to products_path, alert: "You do not have permission."
    end
  end

  def edit
  end

  def update
    if current_user.admin?
      if @product.update_attributes(product_params)
        redirect_to product_path(id: @product.id), notice: "Successfully updated product."
      else
        render :edit
      end
    else
      redirect_to products_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @product.destroy

      redirect_to products_path, notice: "Successfully deleted product."
    else
      redirect_to products_path, alert: "You do not have permission."
    end
  end

  private
  def find_product
    @product = Product.friendly.find(params[:id])
  end

  def build_csv
    CSV.generate do |csv|
      csv << Recipient.csv_columns
      @csv_related_recipients.each { |record| csv << record.to_csv }
    end
  end

  def product_params
    params.require(:product).permit(
      :product_name,
      :description,
      :code,
      :base_price,
      :length_price,
      :product_line_id,
      product_line_attributes: [
        :id,
        :product_line],
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
        )
  end

end