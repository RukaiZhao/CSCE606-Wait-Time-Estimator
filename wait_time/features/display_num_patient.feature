Feature: display number of patients
  
  As a patient,
  I want to see how many people are in front of me
  So that I want to see the number of patients
   

  
  Scenario: First Patient sign 
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "0123456789"
    And I press "signing"
    Then I follow "New Patient"
    Then I shoud be on signin page
    
  
  Scenario: Second Patient sign in
    When I direct to the signin page
    And I fill in "patient name" with "Sam"
    And I fill in "patient number" with "0123456789"
    And I press "signing"
   
    
  


