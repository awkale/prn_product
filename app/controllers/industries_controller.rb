class IndustriesController < ApplicationController
  before_action :find_industry, :only => [:show, :edit, :update, :destroy]
  include TheSortableTreeController::Rebuild
  layout 'page'

  def index
    @industries = Industry.all
    authorize Industry
  end

  def new
    @industry = Industry.new
    authorize @industry
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
      @industry = Industry.new(industry_params)
      if @industry.save
        redirect_to manage_industries_path
      else
        render :new
      end
  end

  def edit

  end

  def update
      if @industry.update_attributes(industry_params)
        redirect_to manage_industries_path, notice: "Successfully updated industry."
      else
        render :edit
      end
  end

  def destroy
      @industry.destroy

      redirect_to manage_industries_path
  end

  def manage
      @industries = Industry.nested_set.select('id, industry_name, parent_id').all
  end

  private
  def find_industry
    @industry = Industry.friendly.find(params[:id])
    authorize @industry
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
