class PageView < ActiveRecord::Base
	validates :userId, :url, :title, presence: true



	def self.create_from_api(params)
    page_view = PageView.create(build_page_view_params(params))
   	return page_view
	end
	
	def self.build_page_view_params(params)
		page_view_params = {}
		page_view_params[:userId] = params[:userId]
		page_view_params[:path] = params[:properties][:path]
		page_view_params[:referrer] = params[:properties][:referrer]
		page_view_params[:title] = params[:properties][:title]
		page_view_params[:url] = params[:properties][:url]
		 return page_view_params
	end		

	scope :filter_by_referrer, lambda { |keyword|
    where("lower(referrer) LIKE ?", "%#{keyword.downcase}%" ) 
  }


	scope :filter_by_date, lambda { |start_time, end_time|
    where("created_at BETWEEN ? AND ?", start_time, end_time) 
  }
end

