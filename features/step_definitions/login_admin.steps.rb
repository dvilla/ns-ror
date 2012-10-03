Given /^I click on the "(.*?)" button$/ do |button|
  @admin = FactoryGirl.create(:admin, name: 'Fulanito', password: 'fulano200', password_confirmation: 'fulano200', email: 'fulano@gmail.com')
  visit root_path
  click_on button
end

When /^I fill the form with my admin credentials$/ do
  fill_in 'admin_email', with: @admin.email
  fill_in 'admin_password', with: @admin.password
  click_on 'Sign in'
end

Then /^I see the library options in menu$/ do
  page.should have_content('Library')
end

