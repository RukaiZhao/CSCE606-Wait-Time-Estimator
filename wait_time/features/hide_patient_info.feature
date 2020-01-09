Feature: hide patient's information
  
  As a patient,
  I do not want other people to see my information after I signed up.
  So that I want to hide my information.
  
  Background: patients in database
 
  Given the following patients exist:
  | name        | number        | time    |
  | Amy         | 1234567891    | 9:00    |
  | Blade       | 1234567892    | 9:30    |
  | _name       | 0000000007    | 12:00   |
  | _name       | 0000000008    | 12:30   | 
  | _name       | 0000000009    | 13:00   |
  | _name       | 0000000010    | 13:30   |
  
  Scenario: Patient sign in
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "0123456789"
    And I press "signing"
    Then I should not see "Sam" and "0123456789"
  
  Scenario: Patient sign in incorrectly
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "xxx"
    And I press "signing"
    Then I should not see "Sam" and "xxx"

