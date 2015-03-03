class Purchase < ActiveRecord::Base
	validates :userId, presence: true
end
