class Purchase < ActiveRecord::Base
	validates :userId, presence: true


	def self.create_from_api(params)
    purchase = Purchase.create(build_purchase_params(params))
   	return purchase
	end
	
	def self.build_purchase_params(params)
		purchase_params = {}
		purchase_params[:userId] = params[:userId]
		purchase_params[:revenue] = params[:properties][:revenue]
		purchase_params[:shippingMethod] = params[:properties][:shippingMethod]
		return purchase_params
	end		
end
