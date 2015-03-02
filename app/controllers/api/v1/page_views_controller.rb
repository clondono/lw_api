class Api::V1::PageViewsController < ApplicationController
  respond_to :json

  def index
  	respond_with PageView.all 
  end
  
  def show
    respond_with PageView.find(params[:id])
  end
end
