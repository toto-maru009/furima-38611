class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.repuire(:purchase_buyer).permit(:municipality, :address, :building_name, :telephone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end

end
