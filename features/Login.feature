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
  Scenario Outline: Verify successful logout with multiple users
    And I click the "Log in" button in the navigation bar
    And I should see a modal with the title "Log in"
    When I fill out the login form with the following credentials:
      | Username | <username> |
      | Password | <password> |
    And I click the "Log in" button on the modal
    And I should see the text "Welcome <username>" in the top right corner
    When I click the "Log out" button in the navigation bar
    Then I should not see the text "Welcome <username>" in the top right corner
    And I should see the "Log in" button in the navigation bar

    Examples: 
      | username | password |
      | test     | test     |
      | prueba   | prueba   |
      | juan     | juan     |