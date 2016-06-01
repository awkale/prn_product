class DistributionsController < ApplicationController
  def index
    @distributions = Distribution.includes(:product, :recipient).order('products.product_name ASC', 'recipients.recipient_name ASC').page(params[:page])
  end

  def new
    @distribution = Distribution.new
    @distribution.recipient_id = params[:recipient_id]
    @recipient = Recipient.find(params[:recipient_id])
  end

  def show
    @distribution = Distribution.find(params[:id])
  end

  def create
    @distribution = Distribution.new(distribution_params)
    if @distribution.save
      redirect_to @distribution.recipient
    else
      render :new
    end
  end

  def edit
    @distribution = Distribution.find(params[:id])
  end

  def update
    @distribution = Distribution.find(params[:id])

    distribution_params = params.require(:distribution).permit(:recipient_id, :product_id)
    @distribution.update_attributes(distribution_params)

    redirect_to root_path
  end

  def destroy
    @distribution = Distribution.find(params[:id])
    @distribution.destroy

    redirect_to distributions_path
  end

  private
  def distribution_params
    params.require(:distribution).permit(:recipient_id, :product_id, product_attributes: [:product_name])
  end

end
