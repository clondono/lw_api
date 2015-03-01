class PageView < ActiveRecord::Base
	validates :userId, :url, :title, presence: true
end
