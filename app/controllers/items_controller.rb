class ItemsController < ApplicationController

  before_action :check_if_owner, only: [:edit, :update, :destroy]

  def check_if_owner

    item = Item.find(params[:id])
    if item.purchase.id != current_user.id
      redirect_to "/items", notice: "Nope! Not your Item"
  end
end

  def index
   @item = Item.all
  
  ##  where({ :user_id => current_user.id})
  ##  current_user.items
  ##  @i = Item.ransack(params[:q])
  ##  @items = @i.result
  
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.purchase_id = params[:purchase_id]
    @item.item = params[:item]

    if @item.save
      redirect_to "/items", :notice => "Item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.purchase_id = params[:purchase_id]
    @item.item = params[:item]

    if @item.save
      redirect_to "/items", :notice => "Item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to "/items", :notice => "Item deleted."
  end
end
