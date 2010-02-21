Feature: Manage Clients
  In order to allow others access at an administrative level
  As a photographer
  I want to view a list of other clients
  
  Scenario: Client List
    Given I have clients named Frank, Homer
    When I go to the list of clients
    Then I should see "Frank"
    And I should see "Homer"