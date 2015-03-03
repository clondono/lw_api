class Api::V1::VisitsController < ApplicationController
  respond_to :json

  def index
    respond_with Visit.search(params) 
  end
  
  def show
    respond_with Visit.find(params[:id])
  end

  def create
    visit = Visit.create(visit_params)
    if visit.save
      render json: visit, status: 201, location: [:api, visit]
    else
      render json: { errors: visit.errors }, status: 422
    end
  end
  
  private

    def visit_params
      params.require(:visit).permit(:email, :name, :friendCount, :userId, :subscriptionPlan) 
    end
end
