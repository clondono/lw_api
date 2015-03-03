class Api::V1::VisitsController < ApplicationController
  respond_to :json

  def index
    respond_with Visit.all 
  end
  
  def show
    respond_with Visit.find(params[:id])
  end

  def create
    page_view = Visit.create(visit_params)
    if page_view.save
      render json: page_view, status: 201, location: [:api, page_view]
    else
      render json: { errors: page_view.errors }, status: 422
    end
  end
  
  private

    def visit_params
      params.require(:visit).permit(:email, :name, :friendCount, :userId, :subscriptionPlan) 
    end
end
