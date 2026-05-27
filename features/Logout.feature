Feature: As a QA Automation Engineer
         I want to test the Log out functionality
         so I ensure users are able to log out of the page

Background: 
    Given I browse to the Demoblaze homepage
    
Scenario: Verify successful logout
    And I click the "Log in" button in the navigation bar
    And I should see a modal with the title "Log in"
    When I fill out the login form with the following credentials:
      | Username | test |
      | Password | test |
    And I click the "Log in" button on the modal
    And I should see the text "Welcome test" in the top right corner
    When I click the "Log out" button in the navigation bar
    Then I should not see the text "Welcome test" in the top right corner
    And I should see the "Log in" button in the navigation bar