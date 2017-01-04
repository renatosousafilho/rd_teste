FactoryGirl.define do
	factory :user, :aliases => [:likeable] do
		sequence(:email) { |n| "johndoe#{n}@gmail.com" }
		password "secretpassword"

		factory :user_without_email do
			email nil
		end
	end
end
