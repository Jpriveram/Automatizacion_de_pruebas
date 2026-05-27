Feature: As a QA Automation Engineer
         I want to test the Log in functionality
         so I ensure users are able to log in to the page

Background: 
    Given I browse to the Demoblaze homepage

@open
Scenario: Verify the Log in modal opens correctly
  When I click the "Log in" button in the navigation bar
  Then I should see a modal with the title "Log in"

@close
Scenario: Verify the Log in modal closes correctly after clicking the "x"
  And I click the "Log in" button in the navigation bar
  And I should see a modal with the title "Log in"
  When I click the "x" close icon on the modal
  Then the modal should no longer be visible

@close2
Scenario: Verify the Log in modal closes correctly after clicking the "x"
  And I click the "Log in" button in the navigation bar
  And I should see a modal with the title "Log in"
  When I click the "Close" button on the modal
  Then the modal should no longer be visible

@login @negative
  Scenario: Verify alert appears when submitting an empty log in form
    And I click the "Log in" button in the navigation bar
    And I should see a modal with the title "Log in"
    When I click the "Log in" button on the modal
    Then I should see a browser alert saying "Please fill out Username and Password."

@login1 @positive
  Scenario: Verify successful login with valid credentials
    And I click the "Log in" button in the navigation bar
    And I should see a modal with the title "Log in"
    When I fill out the login form with the following credentials:
      | Username | test |
      | Password | test |
    And I click the "Log in" button on the modal
    Then I should see the text "Welcome test" in the top right corner