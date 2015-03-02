class Api::V1::PageViewsController < ApplicationController
  respond_to :json

  def show
    respond_with PageView.find(params[:id])
  end
end
