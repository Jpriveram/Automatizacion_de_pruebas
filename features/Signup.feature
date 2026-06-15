Feature: As a QA Automation Engineer
         I want to test the Sign up functionality
         so I ensure new users are able to register on the page

Background:
    Given I browse to the Demoblaze homepage

@signup @open
Scenario: Verify the Sign up modal opens correctly
  When I click the "Sign up" button in the navigation bar
  Then I should see a modal with the title "Sign up"

@signup @close
Scenario: Verify the Sign up modal closes correctly after clicking the "x"
  And I click the "Sign up" button in the navigation bar
  And I should see a modal with the title "Sign up"
  When I click the "x" close icon on the modal
  Then the modal should no longer be visible

@signup @close2
Scenario: Verify the Sign up modal closes correctly after clicking the "Close" button
  And I click the "Sign up" button in the navigation bar
  And I should see a modal with the title "Sign up"
  When I click the "Close" button on the modal
  Then the modal should no longer be visible

@signup @negative
Scenario: Verify alert appears when submitting an empty sign up form
  And I click the "Sign up" button in the navigation bar
  And I should see a modal with the title "Sign up"
  When I click the "Sign up" button on the modal
  Then I should see a browser alert saying "Please fill out Username and Password."

@signup @positive @smoke
Scenario: Verify successful sign up with new credentials
  And I click the "Sign up" button in the navigation bar
  And I should see a modal with the title "Sign up"
  When I fill out the sign up form with unique credentials:
    | Username | automation_user |
    | Password | Test12345       |
  And I click the "Sign up" button on the modal
  Then I should see a browser alert saying "Sign up successful."
