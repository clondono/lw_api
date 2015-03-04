FactoryGirl.define do
  factory :visit do
    userId "user123"
		email { Faker::Internet.email() }
		name  { Faker::Name.name() }
		subscriptionPlan "MyString"
		friendCount { rand() * 100 }
  end

end
