# Steps definitions for authors

Given /^I am on the new author page$/ do
  visit new_author_path
end

When /^I fill the form with the name (.*?)$/ do |name|
  @name = name
  fill_in 'name', with: name
  click_on 'save'
end

Then /^I should see the new author information$/ do
  page.should have_content(@name)
end

Then /^See successfully created message$/ do
  page.should have_content("Author was successfully created")
end				


Given /^I am on the edit author page$/ do
  @author = FactoryGirl.create(:author)
  visit edit_author_path(@author)
end

When /^I change his name$/ do
  @name = 'Ernesto'
  fill_in 'name', with: @name
  click_on 'save'
end

Then /^I see the author with the new name$/ do
  page.should have_content(@name)
end
