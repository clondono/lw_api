class Visit < ActiveRecord::Base
		validates :userId, presence: true



	def self.create_from_api(params)
    visit = Visit.create(build_visit_params(params))
   	return visit
	end
	
	def self.build_visit_params(params)
		visit_params = {}
		visit_params[:userId] = params[:userId]
		visit_params[:email] = params[:traits][:email]
		visit_params[:name] = params[:traits][:name]
		visit_params[:subscriptionPlan] =   params[:traits][:subscriptionPlan]
		visit_params[:friendCount] =   params[:traits][:friendCount]
		 return visit_params
	end		
end
