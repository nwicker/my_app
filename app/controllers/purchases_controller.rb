class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new
    @purchase.amount = params[:amount]
    @purchase.datetime = params[:datetime]
    @purchase.location = params[:location]
    @purchase.user_id = current_user.id
    @purchase.account_balance_change = params[:account_balance_change]

    if @purchase.save
      redirect_to "/purchases", :notice => "Purchase created successfully."
    else
      render 'new'
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])

    @purchase.amount = params[:amount]
    @purchase.datetime = params[:datetime]
    @purchase.location = params[:location]
    @purchase.user_id = params[:current_user]
    @purchase.account_balance_change = params[:account_balance_change]

    if @purchase.save
      redirect_to "/purchases", :notice => "Purchase updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])

    @purchase.destroy

    redirect_to "/purchases", :notice => "Purchase deleted."
  end
end
