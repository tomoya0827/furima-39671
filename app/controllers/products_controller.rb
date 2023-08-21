class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @product = Product.new
  end

  @product = Product.new(product_params)
  if @product.save
    redirect_to root_path
  else
    render :new

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :condition_id, :cost_id, :prefecture_id, :delivery_day_id, :price)
  end
end
