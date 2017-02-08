class Api::V1::ProductsController < Api::V1::BaseController
  def index
    products = Product.all
  end
end
