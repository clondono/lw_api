class Api::V1::PurchasesController < ApplicationController
  respond_to :json

  def index
    respond_with Purchase.search(params) 
  end
  
  def show
    respond_with Purchase.find(params[:id])
  end

  def create
    purchase = Purchase.create(purchase_params)
    if purchase.save
      render json: purchase, status: 201, location: [:api, purchase]
    else
      render json: { errors: purchase.errors }, status: 422
    end
  end
  
  private

    def purchase_params
      params.require(:purchase).permit( :userId, :shippingMethod, :revenue) 
    end
end
