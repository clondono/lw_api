require 'active_support/core_ext'

FactoryGirl.define do
  factory :page_view do
    userId { Faker::Internet.user_name() }

		path { Faker::Internet.http_url() }
		referrer "www.google.com"
		title "The Title"
		url { Faker::Internet.http_url() }
		created_at { DateTime.now() }
  end

end
