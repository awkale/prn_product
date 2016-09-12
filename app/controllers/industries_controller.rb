class IndustriesController < ApplicationController
  before_action :find_industry, :only => [:show, :edit, :update, :destroy]
  include TheSortableTreeController::Rebuild
  layout 'page'

  def index
    @industries = Industry.all
  end

  def new
    @industry = Industry.new
  end

  def show
    @related_recipients = @industry.recipients
    @search = @related_recipients.ransack(params[:q])
    @search.sorts = 'sort_by_name asc' if @search.sorts.empty?
    @related_recipients = @search.result(distinct: true)
                         .includes(:category, :multimedia)
                         .page(params[:page]).per(params[:limit])
  end

  def create
    if current_user.admin?
      @industry = Industry.new(industry_params)
      if @industry.save
        redirect_to manage_industries_path
      else
        render :new
      end
    else
      redirect_to manage_industries_path, alert: "You do not have permission."
    end
  end

  def edit

  end

  def update
    if current_user.admin?
      if @industry.update_attributes(industry_params)
        redirect_to manage_industries_path, notice: "Successfully updated industry."
      else
        render :edit
      end
    else
      redirect_to manage_industries_path, alert: "You do not have permission."
    end
  end

  def destroy
    if current_user.admin?
      @industry.destroy

      redirect_to manage_industries_path
    else
      redirect_to manage_industries_path, alert: "You do not have permission."
    end
  end

  def manage
    if current_user.admin?
      @industries = Industry.nested_set.select('id, industry_name, parent_id').all
    else
      redirect_to manage_industries_path, alert: "You do not have permission."
    end
  end

  private
  def find_industry
    @industry = Industry.friendly.find(params[:id])
  end

  def industry_params
    params.require(:industry).permit(
      :industry_name,
      :parent_id,
      recipient_ids: [],
      recipient_attributes: [
        :id,
        :recipient_name]
        )
  end
end
