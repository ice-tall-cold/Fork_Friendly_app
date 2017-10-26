Feature: User can login
  Background:
    Given the following users exist:
        | Last_Name | First_Name | Email                   | password      |
        | admin     | admin      | admin@fork-friendly.com | lindafriendly |
  
  Scenario: User can login with his account
    Given I am on the login page
    And I fill in "Email" with "admin@fork-friendly.com"
    And I fill in "Password" with "lindafriendly"
    And I click "log_in_submit"
    And I wait for 3 seconds
    When I go to the sessions page