class Visit < ActiveRecord::Base
		validates :userId, presence: true

	scope :filter_by_date, lambda { |start_time, end_time|
    where("created_at BETWEEN ? AND ?", start_time, end_time).select("DISTINCT userId")  
  }

  def self.search(params ={} )
  	visits = Visit.all
  	end_time = params[:end_time] ? params[:end_time] : DateTime.now
  	visits = visits.filter_by_date(params[:start_time], end_time) if params[:start_time] 
  	visits
  end

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
