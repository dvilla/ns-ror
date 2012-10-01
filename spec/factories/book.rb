FactoryGirl.define do
  factory :book do
	isbn '0123456789123'
	title 'Title1'
	publisher { "#{FactoryGirl.create(:publisher).name}" }
	description 'Some description here...'
	authors { "#{FactoryGirl.create(:author).name}, #{FactoryGirl.create(:author, name: 'Other name').name}" }
  end

  factory :invalid_book, parent: :book do
    title ''
  end
end
