class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_product, only: [:edit, :show, :update, :destroy]


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
  end

  def edit
    if @product.user != current_user || @product.purchase_record
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
       redirect_to product_path
    else 
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.user == current_user
      @product.destroy
    end
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :condition_id, :cost_id, :prefecture_id, :delivery_day_id, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
