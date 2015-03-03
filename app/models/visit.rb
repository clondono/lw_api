class Visit < ActiveRecord::Base
		validates :userId, presence: true
end
