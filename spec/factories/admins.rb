# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    email 'administrator@admin.com'
    password 'admin123'
    password_confirmation 'admin123'
    after(:build) do |admin|
      admin.roles << FactoryGirl.create(:role)
    end
  end

  factory :invalid_admin, parent: :admin do
    email ''
    password ''
    password_confirmation 'admin123'
  end
end
