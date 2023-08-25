class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :check_seller, only: [:index]

  def index
    @product = Product.find(params[:product_id])
    @purcha_address = PurchaAddress.new
  end

  def create
    @purcha_address = PurchaAddress.new(purchase_record_params)
    @product = Product.find(params[:product_id])
    
    if @purcha_address.valid?
      @purcha_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_params
    params.require(:purcha_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_name).merge(product_id: params[:product_id], user_id: current_user.id)
  end

  def check_seller
    product = Product.find(params[:product_id])
    if current_user == product.user
      redirect_to root_path
    end
  end
end
