require 'rails_helper'

describe Api::V1::PageViewsController do

  describe "GET #show" do
    before(:each) do
      @page_view = FactoryGirl.create :page_view
      get :show, id: @page_view.id
    end

    it "returns the information about a reporter on a hash" do
      page_view_response = json_response
      expect(page_view_response[:title]).to eql @page_view.title
    end

    it { should respond_with 200 }
  end

  describe "GET #index" do
  	before(:each) do
  		4.times {FactoryGirl.create :page_view}
  		get :index
  	end

  	it "returns 4 records from the database" do
  		page_view_response = json_response
  		expect(page_view_response[:page_views]).to have(4).items
  	end

  	it { should respond_with 200 }
  end
end
