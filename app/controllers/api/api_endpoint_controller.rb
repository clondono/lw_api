class Api::ApiEndpointController < ApplicationController
  respond_to :json
	
	def create
		if params[:type]=="identify"
				create_visit
		elsif	params[:type]=="page"
				create_page_view
		elsif	params[:type]=="track"
			if params[:event]=="Purchased an Item"
				create_purchase
			end
		end
	end




	private
	def create_visit
		visit = Visit.create_from_api(params)
		if visit.save
  		render json: visit, status: 201, location: [:api, visit]
		end
	end	
	
	def create_page_view
		page_view = PageView.create_from_api(params)
		if page_view.save
  		render json: page_view, status: 201, location: [:api, page_view]
		end
	end	

	def create_purchase
		purchase = Purchase.create_from_api(params)
		if purchase.save
  		render json: purchase, status: 201, location: [:api, purchase]
		end
	end
	
end

