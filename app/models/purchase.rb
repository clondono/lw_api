class Purchase < ActiveRecord::Base
	validates :userId, presence: true

	scope :filter_by_date, lambda { |start_time, end_time|
    where("created_at BETWEEN ? AND ?", start_time, end_time).select("DISTINCT userId") 
  }

  def self.search(params ={} )
  	purchases = Purchase.all
  	end_time = params[:end_time] ? params[:end_time] : DateTime.now
  	purchases = purchases.filter_by_date(params[:start_time], end_time) if params[:start_time] 
  	purchases
  end

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
