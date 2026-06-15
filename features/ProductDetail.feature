Feature: As a QA Automation Engineer
         I want to test the product detail functionality
         so I ensure users can review product information before buying

Background:
    Given I browse to the Demoblaze homepage

@product_detail @open
Scenario: Verify a product detail page opens correctly
  When I open the detail page for product "Samsung galaxy s6"
  Then I should see the product detail with:
    | Name        | Samsung galaxy s6                                                                 |
    | Price       | $360                                                                              |
    | Description | The Samsung Galaxy S6 is powered by 1.5GHz octa-core Samsung Exynos 7420 processor |
  And I should see the "Add to cart" button on the product detail page

@product_detail @outline @smoke
Scenario Outline: Verify product detail information for products listed on the homepage
  When I open the detail page for product "<product>"
  Then I should see product detail title "<product>"
  And I should see product detail price "<price>"
  And I should see a product description containing "<description>"
  And I should see the "Add to cart" button on the product detail page

Examples:
  | product             | price | description                                                         |
  | Samsung galaxy s6   | $360  | The Samsung Galaxy S6 is powered by 1.5GHz octa-core Samsung Exynos |
  | Nokia lumia 1520    | $820  | The Nokia Lumia 1520 is powered by 2.2GHz quad-core Qualcomm        |
  | Nexus 6             | $650  | The Motorola Google Nexus 6 is powered by 2.7GHz quad-core Qualcomm |
