class CategoriesController < ApplicationController
  before_action :find_category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show

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
    category_params = params.require(:category).permit(:category)
    @category.update_attributes(category_params)

    redirect_to categories_path
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:category)
  end
end
