Feature: Users can select categories
  Background:
    Given the following users exist:
        | Last_Name | First_Name | Email              | password |
        | admin     | admin      | sankeerth@tamu.edu | password |
    And I go to the login page
    And I fill in "Email" with "sankeerth@tamu.edu"
    And I fill in "Password" with "password"
    And I click "log_in_submit"
    And I click "Grocery Shopping"
  
  Scenario: Users can choose any preferred dietary considerations in the page
    Given I am on the health_concerns page
    Then I should see "Choose any preferred dietary considerations"
    #And I check "sodium_friendly"
    #And I click "Start Shopping"
    #Then I go to the product_line page