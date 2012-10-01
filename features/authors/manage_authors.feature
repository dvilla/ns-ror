Feature: Manage authors
		As a user
		I want to be able to manage authors

		Scenario: New author
			Given I am on the new author page 
			When I fill the form with the name "Fulanito Perez"
			Then I should see the new author information
			And See successfully created message

		Scenario: Edit author
			Given I am on the edit author page
			When I change his name
			Then I see the author with the new name

 
