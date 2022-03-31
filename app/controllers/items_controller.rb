class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :sold_edit, only: :edit
  def index
     @items = Item.all.order(created_at: :desc)
  end

   def new
     @item = Item.new
   end

  def create
     @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    # redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    # if @item.update(item_params)
    #   redirect_to item_path(params[:id])
    # else
    #   render :edit
    # end
  end

  def destroy
    # @item.destroy
    # redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:trade_name, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_days_id, :detail,:price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_edit
     redirect_to root_path if @item.purchase.present?
  end
end
