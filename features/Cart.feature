Feature: As a QA Automation Engineer
         I want to test the Cart and Purchase functionality
         so I ensure users can add, review, remove and buy products

Background:
    Given I browse to the Demoblaze homepage

@cart @view_product
Scenario: View the product details for "Samsung galaxy s6" from the homepage
  When I click on the product "Samsung galaxy s6"
  Then I should see the product name "Samsung galaxy s6" on the product page
  And I should see the product price and description on the product page

@cart @add_product
Scenario: Add "Samsung galaxy s6" to the cart and verify it appears in the cart table
  When I click on the product "Samsung galaxy s6"
  And I tap the "Add to cart" button
  And I accept the browser alert saying "Product added"
  And I go to the Cart
  Then the cart table should contain the product "Samsung galaxy s6"

@cart @remove_product
Scenario: Remove "Samsung galaxy s6" from the cart and verify the cart is empty
  When I click on the product "Samsung galaxy s6"
  And I tap the "Add to cart" button
  And I accept the browser alert saying "Product added"
  And I go to the Cart
  And I delete the product "Samsung galaxy s6" from the cart
  Then the cart table should be empty

@cart @add_multiple
Scenario Outline: Add multiple products to the cart and verify each one appears
  When I click on the product "<product_name>"
  And I tap the "Add to cart" button
  And I accept the browser alert saying "Product added"
  And I go to the Cart
  Then the cart table should contain the product "<product_name>"

Examples:
  | product_name      |
  | Samsung galaxy s6 |
  | Nokia lumia 1520  |

@purchase @negative
Scenario: Attempt to place an order without filling out the purchase form
  When I go to the Cart
  And I tap the "Place Order" button
  And I tap the "Purchase" button
  Then I should see a browser alert saying "Please fill out Name and Creditcard."

@purchase @positive @e2e
Scenario: Complete a full end-to-end purchase from product selection to confirmation
  When I click on the product "Samsung galaxy s6"
  And I note the price shown on the product page
  And I tap the "Add to cart" button
  And I accept the browser alert saying "Product added"
  And I go to the Cart
  And the total amount to pay should match the product price
  And I tap the "Place Order" button
  And I fill out the purchase form with the following details:
    | Name        | Reynaldo         |
    | Country     | Bolivia          |
    | City        | Cercado          |
    | Credit card | 4111111111111111 |
    | Month       | May              |
    | Year        | 2026             |
  And I tap the "Purchase" button
  Then I should see the confirmation modal "Thank you for your purchase!"
  And I should see the purchase summary contains the name "Reynaldo"
  When I click the "OK" button on the confirmation modal
  Then I should be redirected back to the Demoblaze homepage

@purchase @positive @e2e @multiple
Scenario: Add multiple products and verify the cart total is the sum of their prices
  When I click on the product "Samsung galaxy s6"
  And I add the displayed product price to the expected total
  And I tap the "Add to cart" button
  And I accept the browser alert saying "Product added"
  And I browse to the Demoblaze homepage
  And I click on the product "Nokia lumia 1520"
  And I add the displayed product price to the expected total
  And I tap the "Add to cart" button
  And I accept the browser alert saying "Product added"
  And I go to the Cart
  Then the total amount to pay should match the expected total
