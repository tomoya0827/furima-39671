class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_product, only: [:edit, :show, :update]


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
    if current_user.nil?
      redirect_to new_user_session_path
    elsif @product.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
       redirect_to root_path
    else 
    render :edit, status: :unprocessable_entity
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :condition_id, :cost_id, :prefecture_id, :delivery_day_id, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
