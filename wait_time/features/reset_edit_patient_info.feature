Feature: Administrator ables to log in

As an administrator/staff
I want to reset the walkin and appointment
So that I can start a new appointment

 Given the following patients exist:
  | name        | number        | time    |
  | Amy         | 1234567891    | 9:00    |
  | Blade       | 1234567892    | 9:30    |

Scenario: reset page
    When I direct to the admin page
    And I fill on "Username" with "admin"
    And I fill on "Password" with "admin"
    And I press "Sign in"
    And I press "reset" 
    Then I should not see "Amy" and "1234567891"
    Then I should not see "Blade" and "1234567892"

    
   
 Scenario: edit page
	When I direct to the admin page
    And I fill on "Username" with "admin"
    And I fill on "Password" with "admin"
    And I press "Sign in"
    