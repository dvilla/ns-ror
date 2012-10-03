Feature: Login to system
		As a part of the users I want to login
		with my admin account

		Scenario: Login to library
				Given I click on the "Sign in Admin" button
				When I fill the form with my admin credentials
				Then I see the library options in menu
