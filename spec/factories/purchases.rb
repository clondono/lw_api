FactoryGirl.define do
  factory :purchase do
    userId { Faker::Internet.user_name() }
 		revenue { rand(10000) /100 }
		shippingMethod "MyString"
  end

end
