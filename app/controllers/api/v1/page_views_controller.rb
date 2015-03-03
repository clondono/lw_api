class Api::V1::PageViewsController < ApplicationController
  respond_to :json

  def index
  	respond_with PageView.all 
  end
  
  def show
    respond_with PageView.find(params[:id])
  end

  def create
    page_view = PageView.create(page_view_params)
    if page_view.save
      render json: page_view, status: 201, location: [:api, page_view]
    else
      render json: { errors: page_view.errors }, status: 422
    end
  end
  
  private

    def page_view_params
      params.require(:page_view).permit(:title, :url, :path, :userId, :referrer) 
    end
end
