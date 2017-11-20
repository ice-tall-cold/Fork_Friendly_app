Feature: Admin user can login
  Background:
    Given the following users exist:
        | Last_Name | First_Name | Email              | password |
        | admin     | admin      | sankeerth@tamu.edu | password |
  
  Scenario: User can login with his account
    Given I am on the login page
    And I fill in "Email" with "sankeerth@tamu.edu"
    And I fill in "Password" with "password"
    And I click "log_in_submit"
    And I click "Grocery Shopping"
    Then I go to the health_concerns page
