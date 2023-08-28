class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :load_product, only: [:index, :create]
  before_action :check_seller, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purcha_address = PurchaAddress.new
  end

  def create
    @purcha_address = PurchaAddress.new(purchase_record_params)
    
    if @purcha_address.valid?
      pay_product
      @purcha_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def load_product
    @product = Product.find(params[:product_id])
  end

  def purchase_record_params
    params.require(:purcha_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_name).merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end

  def check_seller
    product = Product.find(params[:product_id])
    if current_user == product.user || product.purchase_record
      redirect_to root_path
    end
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
