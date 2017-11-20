Feature: Users can select categories
  Background:
    Given the following users exist:
        | Last_Name | First_Name | Email                   | password      |
        | admin     | admin      | admin@fork-friendly.com | lindafriendly |
    And I go to the login page
    And I fill in "Email" with "admin@fork-friendly.com"
    And I fill in "Password" with "lindafriendly"
    And I click "log_in_submit"
    And I go to the health_concerns page
    #And I click "Salt Shy"
    #And I click "Start Shopping"
   # And I go to the product_line page
    
  Scenario: Users can choose any preferred dietary considerations in the page
    Given I am on the product_lines page
    Then I should see "Start Shopping!"
    #And I click "Meats"
    #And I click "Search"
    #Then I go to the final_cart page