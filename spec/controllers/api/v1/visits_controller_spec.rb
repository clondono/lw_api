require 'rails_helper'


describe Api::V1::VisitsController do

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @visit_attributes = FactoryGirl.attributes_for :visit
        post :create, { visit: @visit_attributes }
      end
      
      it "renders the json representation for the visit record just created" do
        visit_response = json_response
        expect(visit_response[:name]).to eql @visit_attributes[:name]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_visit_attributes = { name: "Smart TV", url: "example.com" }
        post :create, { visit: @invalid_visit_attributes }
      end

      it "renders an errors json" do
        visit_response = json_response
        expect(visit_response).to have_key(:errors)
      end

      it { should respond_with 422 }
    end
  end

  describe "GET #show" do
    before(:each) do
      @visit = FactoryGirl.create :visit
      get :show, id: @visit.id
    end

    it "returns the information about a reporter on a hash" do
      visit_response = json_response
      expect(visit_response[:name]).to eql @visit.name
    end

    it { should respond_with 200 }
  end

  describe "GET #index" do
  	before(:each) do
  		4.times {FactoryGirl.create :visit}
  		get :index
  	end

  	it "returns 4 records from the database" do
  		visit_response = json_response
  		expect(visit_response[:visits]).to have(4).items
  	end

  	it { should respond_with 200 }
  end
end
