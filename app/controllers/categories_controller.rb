class CategoriesController < ApplicationController
  before_action :find_category, :only => [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
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
    if current_user.admin?
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path
      else
        render :new
      end
    else
      redirect_to categories_path, alert: "You do not have permission."
    end
  end

  def edit

  end

  def update
    if current_user.admin?
      if @category.update_attributes(category_params)
        redirect_to categories_path, notice: "Successfully updated category."
      else
        render :edit
      end
    else
      redirect_to categories_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @category.destroy

      redirect_to categories_path
    else
      redirect_to categories_path, alert: "You do not have permission."
    end
  end

  private
  def find_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
