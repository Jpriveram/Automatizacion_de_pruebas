Feature: As a QA Automation Engineer
         I want to test the footer visibility
         so I ensure users can see company information across main Demoblaze pages

Background:
    Given I browse to the Demoblaze homepage

@footer @outline
Scenario Outline: Verify the footer is visible on Demoblaze pages
  When I navigate to the "<page>" page for footer validation
  Then I should see the Demoblaze footer with the following sections:
    | Section       | Expected text              |
    | About Us      | About Us                   |
    | Get in Touch  | Address: 2390 El Camino    |
    | PRODUCT STORE | PRODUCT STORE              |

Examples:
  | page           |
  | Home           |
  | Product detail |
  | Cart           |
