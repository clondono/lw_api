require 'rails_helper'

describe Api::V1::PurchasesController do

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @purchase_attributes = FactoryGirl.attributes_for :purchase
        post :create, { purchase: @purchase_attributes }
      end
      
      it "renders the json representation for the purchase record just created" do
        purchase_response = json_response
        expect(purchase_response[:shippingMethod]).to eql @purchase_attributes[:shippingMethod]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_purchase_attributes = { shippingMethod: "Smart TV", revenue: 23.34 }
        post :create, { purchase: @invalid_purchase_attributes }
      end

      it "renders an errors json" do
        purchase_response = json_response
        expect(purchase_response).to have_key(:errors)
      end

      it { should respond_with 422 }
    end
  end

  describe "GET #show" do
    before(:each) do
      @purchase = FactoryGirl.create :purchase
      get :show, id: @purchase.id
    end

    it "returns the information about a reporter on a hash" do
      purchase_response = json_response
      expect(purchase_response[:shippingMethod]).to eql @purchase.shippingMethod
    end

    it { should respond_with 200 }
  end

  describe "GET #index" do
  	before(:each) do
  		4.times {FactoryGirl.create :purchase}
  		get :index
  	end

  	it "returns 4 records from the database" do
  		purchase_response = json_response
  		expect(purchase_response[:purchases]).to have(4).items
  	end

  	it { should respond_with 200 }
  end
end
