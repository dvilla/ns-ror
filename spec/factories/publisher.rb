FactoryGirl.define do
  factory :publisher do
	name 'Wrox'
  end

  factory :invalid_publisher, parent: :publisher do
    name ''
  end
end
