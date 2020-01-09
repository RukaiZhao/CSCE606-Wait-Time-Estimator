Feature: Administrator ables to log in

As an administrator/staff
I want to update appointment details
So that walk-in patients are allotted time accordingly

Scenario: Password correct
    When I direct to the admin page
    And I fill on "Username" with "admin"
    And I fill on "Password" with "admin"
    And I press "Sign in"
    Then I should not see error message "Incorrect Username or Password!"
    And I follow "back"
    Then I must be on admin page

Scenario: Password incorrect
    When I direct to the admin page
    And I fill on "Username" with "admin"
    And I fill on "Password" with "12345667"
    And I press "Sign in"
    Then I should see error message "Incorrect Username or Password!"
    Then I must be on admin page
    
   
 
