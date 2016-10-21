class GraphsController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    result = Schema.execute(params[:query], variables: params[:variables])
    render json: result
  end
end
