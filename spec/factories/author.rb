FactoryGirl.define do
	factory :author do
		name 'Fulanito Perez'
	end

	factory :invalid_author, parent: :author do
		name ''
	end
end
