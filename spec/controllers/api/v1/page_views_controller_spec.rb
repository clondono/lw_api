require 'rails_helper'

describe Api::V1::PageViewsController do

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @page_view_attributes = FactoryGirl.attributes_for :page_view
        post :create, { page_view: @page_view_attributes }
      end
      
      it "renders the json representation for the page_view record just created" do
        page_view_response = json_response
        expect(page_view_response[:title]).to eql @page_view_attributes[:title]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_page_view_attributes = { title: "Smart TV", url: "example.com" }
        post :create, { page_view: @invalid_page_view_attributes }
      end

      it "renders an errors json" do
        page_view_response = json_response
        expect(page_view_response).to have_key(:errors)
      end

      it { should respond_with 422 }
    end
  end

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
