Feature: As a QA Automation Engineer
         I want to test the Contact functionality
         so I ensure users can reach out for support

Background: 
    Given I browse to the Demoblaze homepage

@open
Scenario: Verify the Contact modal opens correctly
  When I click the "Contact" button in the navigation bar
  Then I should see a modal with the title "New message"

@close
Scenario: Verify the Contact modal closes correctly after clicking the "x"
  And I click the "Contact" button in the navigation bar
  And I should see a modal with the title "New message"
  When I click the "x" close icon on the modal
  Then the modal should no longer be visible

@close2
Scenario: Verify the Contact modal closes correctly after clicking the "x"
  And I click the "Contact" button in the navigation bar
  And I should see a modal with the title "New message"
  When I click the "Close" button on the modal
  Then the modal should no longer be visible

@support
Scenario: Verify successful submission of the contact form
  And I click the "Contact" button in the navigation bar
  When I fill out the contact form with the following details:
    | Email   | Testemail@gmail.com   |
    | Name    | Email Test            |
    | Message | Test message Capybara |
  And I click the "Send message" button
  Then I should see a browser alert saying "Thanks for the message!!"

