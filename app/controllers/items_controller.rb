class ItemsController < ApplicationController

  def index
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
  end

  private

  def item_params
    params.require(:item).parmit(:image).merge(user_id: current_user.id)
  end
end
