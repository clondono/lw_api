FactoryGirl.define do
  factory :page_view do
    userId Faker::Internet.user_name()

		path Faker::Internet.http_url()
		referrer Faker::Internet.http_url()
		title "The Title"
		url Faker::Internet.http_url()
  end

end
