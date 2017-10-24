Feature: Generate grocery list for user based on selections from the food list
  Background:
    Given the following users exist:
        | last_name | first_name | email          | password | admin |
        | test      | senor      | senor@test.com | testing  | true  |
    And I go to the login page
    And I fill in "Email" with "senor@test.com"
    And I fill in "Password" with "testing"
    And I click "log_in_submit"
    And I go to the upload page
    And I upload the file "fork_friendly_upcs.csv"
    And I press "Import"
    
  Scenario: User chooses foods from the same category
    When I am on the home page
    And I go to the chows page
    And I check "items_Private_Selections_Christopher_s_Eggs"
    And I press "Submit"
    Then I should see "Private Selections Christopher's Eggs"

  Scenario: User chooses foods from different categories
    When I am on the home page
    And I go to the chows page
    And I check "items_Kroger_Fat_Free_Onion_Dip"
    And I check "items_Deb_E__Just_Whites"
    And I press "Submit"
    Then I should see "Kroger"
    And I should see "Deb"
    