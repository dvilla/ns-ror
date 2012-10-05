Given /^I am on the new book page$/ do
  visit new_admin_book_path
end

Given /^I am on the edit book page$/ do
  @book = FactoryGirl.create(:book)
  visit edit_admin_book_path(@book)
end

When /^I fill a form with correct params$/ do
  @book = FactoryGirl.build(:book)
  fill_in 'book_title', with: @book.title
  fill_in 'book_isbn', with: @book.isbn
  fill_in 'book_description', with: @book.description
  fill_in 'book_publisher', with: @book.publisher.name
  fill_in 'book_authors', with: @book.authors.each { |author| "#{author.name}, " }
  click_on 'Save'
end

When /^I fill a form with another params$/ do
  @another_book = FactoryGirl.build(:book, title: 'Another title', isbn: '1234567890123', description: 'another description', publisher: 'Other publisher')
  fill_in 'book_title', with: @another_book.title
  fill_in 'book_isbn', with: @another_book.isbn
  fill_in 'book_description', with: @another_book.description
  fill_in 'book_publisher', with: @another_book.publisher.name
  click_on 'Save'
end

Then /^I should see my new book$/ do
  page.should have_content(@book.title)
  page.should have_content(@book.isbn)
  page.should have_content(@book.description)
  page.should have_content(@book.publisher.name)
  @book.authors.each do |author|
    page.should have_content(author.name)
    page.should have_content("Book was successfully created.")
  end
end

Then /^I should see my book with the data given$/ do
  page.should have_content(@another_book.title)
  page.should have_content(@another_book.isbn)
  page.should have_content(@another_book.description)
  page.should have_content(@another_book.publisher.name)
end
Then /^recive a success message$/ do
  page.should have_content("Book was successfully updated.")
end

Given /^I am on the index book page$/ do
  FactoryGirl.create(:book)
  visit admin_books_path
end

When /^I delete a book$/ do
  click_on('Delete')
end

Then /^I should see a message "(.*?)"$/ do |msj|
  page.should have_content(msj)
end 

Given /^I see a book$/ do
  @libro = FactoryGirl.create(:book)
  visit admin_book_path(@libro)
end

When /^I want to see index page$/ do
  click_on('Back')
end

Then /^I should see all books$/ do
  page.should have_content(@libro.title)
  @libro.authors.each do |author|
    page.should have_content(author.name)
  end
  page.should have_content(@libro.publisher.name)
  page.should have_content(@libro.isbn)
  page.should have_content(@libro.description)
  page.should have_content("Listing books")
end
