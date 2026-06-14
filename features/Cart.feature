Feature: As a QA Automation Engineer
         I want to test the Cart and Purchase functionality
         so I ensure users can add, review, remove and buy products

Background:
    Given I browse to the Demoblaze homepage

@cart @view_product
Scenario: View the product details for "Samsung galaxy s6" from the homepage
  When I open the detail page for product "Samsung galaxy s6"
  Then I should see the product name "Samsung galaxy s6" on the product page
  And I should see the product price and description on the product page

@cart @add_product
Scenario: Add "Samsung galaxy s6" to the cart and verify it appears in the cart table
  When I open the detail page for product "Samsung galaxy s6"
  And I add the product to the cart
  And I accept the browser alert saying "Product added."
  And I go to the cart
  Then the cart table should contain a product

@cart @remove_product
Scenario: Remove "Samsung galaxy s6" from the cart and verify the cart is empty
  When I open the detail page for product "Samsung galaxy s6"
  And I add the product to the cart
  And I accept the browser alert saying "Product added."
  And I go to the cart
  And I delete the product "Samsung galaxy s6" from the cart
  Then the cart table should be empty

@cart @add_multiple
Scenario Outline: Add multiple products to the cart and verify each one appears
  When I open the detail page for product "<product_name>"
  And I add the product to the cart
  And I accept the browser alert saying "Product added."
  And I go to the cart
  Then the cart table should contain the product "<product_name>"

Examples:
  | product_name      |
  | Samsung galaxy s6 |
  | Nokia lumia 1520  |

@purchase @negative
Scenario: Attempt to place an order without filling out the purchase form
  When I go to the cart
  And I start the checkout
  And I confirm the purchase
  Then I accept the browser alert saying "Please fill out Name and Creditcard."

@purchase @positive
Scenario: Complete a successful purchase from the cart
  When I go to the cart
  And I start the checkout
  And I fill out the purchase form with the following details:
    | Name        | Reynaldo         |
    | Country     | Bolivia          |
    | City        | Cercado          |
    | Credit card | 4111111111111111 |
    | Month       | May              |
    | Year        | 2026             |
  And I confirm the purchase
  Then I should see the confirmation modal "Thank you for your purchase!"
  When I accept the purchase confirmation
  Then I should be redirected back to the Demoblaze homepage
