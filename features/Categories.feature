Feature: As a QA Automation Engineer
         I want to test the Categories filter
         so I ensure users can view specific types of products

  Background:
    Given I browse to the Demoblaze homepage

Scenario Outline: Verify the category filters correctly update the item count
    When I click the "<category>" category in the sidebar
    Then the product grid should display exactly <expected_count> items

    Examples:
      | category | expected_count |
      | Phones   | 7              |
      | Laptops  | 6              |
      | Monitors | 2              |