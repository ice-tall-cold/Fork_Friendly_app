Feature: User can view the foods from all categories
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
    
  Scenario: See all foods in the cookies category
    Given I go to the chows page
    And I press "COOKIES"
    Then I should see "Kashi Oatmeal"
  
  Scenario: See all foods in the cornbread category
    Given I am on the chows page
    And I press "CORNBREAD"
    Then I should see "Gladiola"
    
  Scenario: Navigate to home page (boilerplate)
    Given I am on the chows page
    When I follow "Home"
    Then I am on the home page