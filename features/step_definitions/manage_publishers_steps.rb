# Steps definitions for authors

Given /^I am on the new publisher page$/ do
  visit new_admin_publisher_path
end

When /^I fill the publisher form with the name "(.*?)"$/ do |name|
  @publisher = FactoryGirl.build(:publisher, name: name)
  fill_in 'publisher_name', with: @publisher.name
  click_on 'Save'
end

Then /^I should see the new publisher information$/ do
  page.should have_content(@publisher.name)
end

Then /^See "(.*?)" message$/ do |msj|
  page.should have_content(msj)
end

Given /^I am on the edit publisher page of "(.*?)"$/ do |name|
  @publisher = FactoryGirl.create(:publisher, name: name)
  visit edit_admin_publisher_path(@publisher)
end

When /^I change his publisher by "(.*?)"$/ do |name|
  fill_in 'publisher_name', with: name
  click_on 'Save'
end

Then /^I see the publisher page with the "(.*?)" name$/ do |name|
  page.should have_content(name)
end

Then /^See a successfully "(.*?)" message$/ do |msj|
  page.should have_content(msj)
end
