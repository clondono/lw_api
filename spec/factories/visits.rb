FactoryGirl.define do
  factory :visit do
    userId { Faker::Internet.user_name() }
		email { Faker::Internet.email() }
		name  { Faker::Name.name() }
		subscriptionPlan "MyString"
		friendCount { rand() * 100 }
  end

end
