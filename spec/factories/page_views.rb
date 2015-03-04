require 'active_support/core_ext'

FactoryGirl.define do
  factory :page_view do
    userId "user123"

		path { Faker::Internet.http_url() }
		referrer { Faker::Internet.http_url() }
		title "The Title"
		url { Faker::Internet.http_url() }
		created_at { DateTime.now() }
  end

end
