FactoryGirl.define do
  factory :purchase do
    userId "user123"
		revenue { rand(10000) /100 }
		shippingMethod "MyString"
  end

end
