class PageView < ActiveRecord::Base
	validates :userId, :url, :title, presence: true


	scope :filter_by_referrer, lambda { |keyword|
    where("lower(referrer) LIKE ?", "%#{keyword.downcase}%" ).select("DISTINCT userId") 
  }


	scope :filter_by_date, lambda { |start_time, end_time|
    where("created_at BETWEEN ? AND ?", start_time, end_time).select("DISTINCT userId")  
  }

  def self.search(params ={} )
  	page_views = PageView.all
  	end_time = params[:end_time] ? params[:end_time] : DateTime.now
  	page_views = page_views.filter_by_date(params[:start_time], end_time) if params[:start_time] 
  	page_views = page_views.filter_by_referrer(params[:referrer]) if params[:referrer]

  	params[:start_time] ? { unique_count: page_views.length }: page_views

  end

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


end

