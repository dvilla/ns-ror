Feature: Manage authors
		As a Admin
		I want to be able to manage publishers

		Scenario: New publisher
				Given I am on the new publisher page 
				When I fill the publisher form with the name "Woyx"
				Then I should see the new publisher information
				And See "Publisher was successfully created." message

		Scenario: Edit publisher
				Given I am on the edit publisher page of "Woyx"
				When I change his publisher by "Pragmatic Bookshelf"
				Then I see the publisher page with the "Pragmatic Bookshelf" name
				And See a successfully "Publisher was successfully updated." message


