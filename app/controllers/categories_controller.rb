class CategoriesController < ApplicationController
  before_action :find_category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    authorize Category
  end

  def new
    @category = Category.new
    authorize @category
  end

  def show
    @related_recipients = @category.recipients
    @search = @related_recipients.ransack(params[:q])
    @search.sorts = 'sort_by_name asc' if @search.sorts.empty?
    @related_recipients = @search.result(distinct: true)
                         .includes(:category, :multimedia)
                         .page(params[:page]).per(params[:limit])
  end

  def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path
      else
        render :new
      end
  end

  def edit

  end

  def update
      if @category.update_attributes(category_params)
        redirect_to categories_path, notice: "Successfully updated category."
      else
        render :edit
      end
  end

  def destroy
      @category.destroy

      redirect_to categories_path
  end

  private
  def find_category
    @category = Category.friendly.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
