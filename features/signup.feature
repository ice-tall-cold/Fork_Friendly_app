Feature: User can create an account
  Background:
    Given the following users exist:
        | Last_Name | First_Name | Email                  | password |
        | Barker    | Mitchell   | lilstitch@gmail.com    | sdfsdf   |
        | Arroyo    | Brandon    | mediumstitch@gmail.com | sdfsdf   |
        | Wilson    | Kyle       | bigstitch@gmail.com    | sdfsdf   |

  Scenario: Attempt to create account from incomplete information
    Given I am on the signup page
    When I fill in "Last Name" with "Barker"
    And I fill in "First Name" with "Mitchell"
    And I press "create user"
    Then I should see "The form contains 5 errors."
    And I am on the signup page

  Scenario: Attempt to create account with previously registered email
    Given I am on the signup page
    When I fill in "Last Name" with "Stitchell"
    And I fill in "First Name" with "Marker"
    And I fill in "Email" with "lilstitch@gmail.com"
    And I fill in "Password" with "41968:)"
    And I fill in "Confirmation" with "41968:)"
    And I press "create user"
    Then I should see "Email has already been taken"
    And I am on the signup page
    
  Scenario: Create and account with all the required fields
    Given I am on the signup page
    When I fill in "Last Name" with "Stitchell"
    And I fill in "First Name" with "Marker"
    And I fill in "Email" with "lilstitch2@gmail.com"
    And I fill in "Password" with "1135$!"
    And I fill in "Confirmation" with "1135$!"
    And I press "create user"
    Then I am on the "https://www.google.com/"