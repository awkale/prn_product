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
    @recipients = @category.recipients
    if params[:search]
      @related_recipients = Recipient.search(params[:search])
      @related_recipients = Kaminari.paginate_array(@recipients.sort_by{|t| t.recipient_name.downcase.sub(/^the |a |an /i,"")}).page(params[:page])
    elsif params[:limit]
      @related_recipients = Kaminari.paginate_array(@recipients.all.sort_by{|t| t.recipient_name.downcase.sub(/^the |a |an /i,"")}).page(params[:page]).per(params[:limit])
    else
      @related_recipients = Kaminari.paginate_array(@recipients.all.sort_by{|t| t.recipient_name.downcase.sub(/^the |a |an /i,"")}).page(params[:page])
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
  def category_params
    params.require(:category).permit(:name)
  end
end
