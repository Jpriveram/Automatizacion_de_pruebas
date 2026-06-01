Feature: As a QA Automation Engineer
         I want to test the Cart and Purchase functionality
         so I ensure users can add, review, remove and buy products

Background:
    Given I browse to the Demoblaze homepage

@cart @view_product
Scenario: View the product details for "Samsung galaxy s6" from the homepage
  When I select the product "Samsung galaxy s6" using CSS selector "#tbodyid > div:nth-child(1) > div > div > h4 > a"
  Then I should see the product name "Samsung galaxy s6" on the product page
  And I should see the product price and description on the product page

@cart @add_product
Scenario: Add "Samsung galaxy s6" to the cart and verify it appears in the cart table
  When I select the product "Samsung galaxy s6" using CSS selector "#tbodyid > div:nth-child(1) > div > div > h4 > a"
  And I click the "Add to cart" button using XPath "/html/body/div[5]/div/div[2]/div[2]/div/a"
  And I accept the browser alert saying "Product added."
  And I navigate to the Cart using CSS selector "#navbarExample > ul > li:nth-child(4) > a"
  Then the cart table should contain a product

@cart @remove_product
Scenario: Remove "Samsung galaxy s6" from the cart and verify the cart is empty
  When I select the product "Samsung galaxy s6" using CSS selector "#tbodyid > div:nth-child(1) > div > div > h4 > a"
  And I click the "Add to cart" button using XPath "/html/body/div[5]/div/div[2]/div[2]/div/a"
  And I accept the browser alert saying "Product added."
  And I navigate to the Cart using CSS selector "#navbarExample > ul > li:nth-child(4) > a"
  And I delete the product using CSS selector "#tbodyid > tr:nth-child(1) > td:nth-child(4) > a"
  Then the cart table should be empty

@cart @add_multiple
Scenario Outline: Add multiple products to the cart and verify each one appears
  When I select the product "<product_name>" using CSS selector "<css_selector>"
  And I click the "Add to cart" button using XPath "/html/body/div[5]/div/div[2]/div[2]/div/a"
  And I accept the browser alert saying "Product added."
  And I navigate to the Cart using CSS selector "#navbarExample > ul > li:nth-child(4) > a"
  Then the cart table should contain the product "<product_name>"

Examples:
  | product_name      | css_selector                                     |
  | Samsung galaxy s6 | #tbodyid > div:nth-child(1) > div > div > h4 > a |
  | Nokia lumia 1520  | #tbodyid > div:nth-child(2) > div > div > h4 > a |

@purchase @negative
Scenario: Attempt to place an order without filling out the purchase form
  When I navigate to the Cart using XPath "/html/body/nav/div/ul/li[4]/a"
  And I click the "Place Order" button using XPath "/html/body/div[6]/div/div[2]/button"
  And I click the "Purchase" button using XPath "/html/body/div[3]/div/div/div[3]/button[2]"
  Then I accept the browser alert saying "Please fill out Name and Creditcard."

@purchase @positive
Scenario: Complete a successful purchase from the cart
  When I navigate to the Cart using XPath "/html/body/nav/div/ul/li[4]/a"
  And I click the "Place Order" button using XPath "/html/body/div[6]/div/div[2]/button"
  And I fill out the purchase form with the following details:
    | Name        | Reynaldo         |
    | Country     | Bolivia          |
    | City        | Cercado          |
    | Credit card | 4111111111111111 |
    | Month       | May              |
    | Year        | 2026             |
  And I click the "Purchase" button using XPath "/html/body/div[3]/div/div/div[3]/button[2]"
  Then I should see the confirmation modal "Thank you for your purchase!"
  When I click the "OK" button using XPath "/html/body/div[10]/div[7]/div/button"
  Then I should be redirected back to the Demoblaze homepage
