Feature: Manage books
	As a user
	I want to be able to manage a books

	Scenario: New Book
		Given I am on the new book page
		When I fill a form with correct params
		Then I should see my new book

	Scenario: Edit a Book
		Given I am on the edit book page
		When I fill a form with another params
		Then I should see my book with the data given 
		And recive a success message

	Scenario: Delete a book
		Given I am on the index book page
		When I delete a book
		Then I should see a message "Book successfully deleted."
		
	Scenario: Visit index
	    Given I see a book
		When I want to see index page
		Then I should see all books
