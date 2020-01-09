Feature: display wait time
  
  As a patient,
  I want to sign up into the system,
  So that I know my estimated wait time.
  
  Background: patients in database
 
  Given the following patients exist:
  | name        | number        | time    |
  | Amy         | 1234567891    | 9:00    |
  | Blade       | 1234567892    | 9:30    |
  | _name       | 0000000007    | 12:00   |
  | _name       | 0000000008    | 12:30   | 
  | _name       | 0000000009    | 13:00   |
  | _name       | 0000000010    | 13:30   |
  | _name       | 0000000011    | 14:00   | 
  | _name       | 0000000012    | 14:30   |
  | _name       | 0000000013    | 15:00   |
  
  Scenario: Patient fill in phone number with digits
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "xxx"
    And I press "signing"
    Then I should see error message "ERROR: No Duplicate entry allowed. Number can contain only 10 digits from 0-9."
  
  Scenario: Patient fill in phone number with valid length
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "13"
    And I press "signing"
    Then I should see error message "ERROR: No Duplicate entry allowed. Number can contain only 10 digits from 0-9."
    
  Scenario: Patient fill in unique phone number
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "1234567891"
    And I press "signing"
    Then I should see error message "ERROR: No Duplicate entry allowed. Number can contain only 10 digits from 0-9."
  
  Scenario: Patient sees the estimated wait time
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "1234567893"
    And I press "signing"
   