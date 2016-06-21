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
    @industry.update_attributes(industry_params)

    redirect_to manage_industries_path
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
    @industry = Industry.find(params[:id])
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
