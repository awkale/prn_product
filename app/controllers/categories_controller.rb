class CategoriesController < ApplicationController
  before_action :find_category, :only => [:show, :edit, :update, :destroy]
  layout 'page'
  helper_method :sort_column, :sort_direction

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    params[:sort] ||= 'sort_by_name'

    @recipients = @category.recipients
    if params[:limit]
      @related_recipients = @recipients.order(sort_column + ' ' + sort_direction).includes(:multimedia, :renderings).page(params[:page]).per(params[:limit])
    else
      @related_recipients = @recipients.order(sort_column + ' ' + sort_direction).includes(:multimedia, :renderings).page(params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end
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
    @category = Category.find(params[:id])
  end

  def sort_column
    Recipient.column_names.include?(params[:sort]) ? params[:sort] : 'sort_by_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
