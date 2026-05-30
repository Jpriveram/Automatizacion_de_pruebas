Feature: As a QA Automation Engineer
         I want to test the Carousel functionality
         so I ensure users can view all promotional images

  Background:
    Given I browse to the Demoblaze homepage

@next
Scenario: Verify the user can navigate to the next slide manually
    And the first promotional slide should be visible
    When I click the "next" arrow on the carousel
    Then the "Second slide" promotional slide should become visible
@previous
Scenario: Verify the user can navigate to the previous slide manually
    And the first promotional slide should be visible
    When I click the "previous" arrow on the carousel
    Then the "Third slide" promotional slide should become visible

@indicator
Scenario: Verify the user can navigate using the bottom indicators
    When I click the indicator for slide 3
    Then the "Third slide" promotional slide should become visible