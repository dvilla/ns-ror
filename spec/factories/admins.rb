# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    email 'administrator@admin.com'
    password 'admin123'
    password_confirmation 'admin123'
  end

  factory :invalid_admin, parent: :admin do
    email ''
    password ''
    password_confirmation 'admin123'
  end
end
