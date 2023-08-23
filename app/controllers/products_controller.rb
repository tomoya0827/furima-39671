class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :condition_id, :cost_id, :prefecture_id, :delivery_day_id, :price)
  end
end
