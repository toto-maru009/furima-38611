class ItemsController < ApplicationController

  def index
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).parmit(:image).merge(user_id: current_user.id)
  end
end
