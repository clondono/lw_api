require 'rails_helper'

RSpec.describe Api::V1::PageViewsController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.lwapi.v1" }

  describe "Get #show" do
  	before(:each) do
  		@page_view = FactoryGirl.create :page_view
  		get :show, id:@page_view.id, format: :json
  	end

    it "returns the information about a reporter on a hash" do
      page_view_response = JSON.parse(response.body, symbolize_names: true)
    end
  
    it { should respond_with 200 }
  end
end
