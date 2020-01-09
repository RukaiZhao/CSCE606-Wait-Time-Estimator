Feature: add walk in with exist appointment

As an administrator/staff
I want to update appointment details
So that walk-in patients are allotted time accordingly

Background: patients in database
 
  Given the following patients exist:
  | name        | number        | time  |
  | Amy         | 1234567892    | 9:00  |
  | _name       | 0000000002    | 9:30  |
  | _name       | 0000000003    | 10:00 |
  | _name       | 0000000004    | 10:30 |
  | _name       | 0000000005    | 11:00 |
  | _name       | 0000000006    | 11:30 |
  | _name       | 0000000007    | 12:00 |
  | _name       | 0000000008    | 12:30 | 
  | _name       | 0000000009    | 13:00 |
  | _name       | 0000000010    | 13:30 |
  

   Scenario: First Patient sign 
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "0123456789"
    And I press "signing"
    
    
   
 
