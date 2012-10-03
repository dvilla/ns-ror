# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Fulanito'
    uid '123456798'
    provider 'google_oauth2'
    email 'fulanito@mail.com'
    password 'pass123'
  end

  factory :invalid_user, parent: :user do
    name ''
    email ''
    password ''
  end

end
