class Api::V1::ProductsController < Api::V1::BaseController
  include ActiveHashRelation

  def index
    products = Product.all

    products = apply_filters(products, params)

    render(
      json: ActiveModel::ArraySerializer.new(
        products,
        each_serializer: Api::V1::ProductSerializer,
        root: 'products',
      )
    )
  end

  def show
    product = Product.find(params[:id])

    render(json: Api::V1::ProductSerializer.new(product).to_json)
  end
end
