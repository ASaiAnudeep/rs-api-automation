Feature: Authentication

  Scenario: User successfully logs in with valid credentials
    Given I make a POST request to /login
    And I set body to
      """
      {
        "email": "$M{ENV.RS_EMAIL}",
        "password": "$M{ENV.RS_PASSWORD}"
      }
      """
    When I receive a response
    Then I expect response should have a status 200
  
  Scenario: User fails to log in with invalid credentials 
    Given I make a POST request to /login
    And I set body to
      """
      {
        "email": "random@email.com",
        "password": "random@password"
      }
      """
    When I receive a response
    Then I expect response should have a status 400
    And I expect response should have a json like
      """
        {
          "message": "Incorrect username or password."
        }
      """
  
  Scenario: User fails to log in with missing credentials 
    Given I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 400
    And I expect response should have a json like
      """
        {
          "message": "Email is missing"
        }
      """
  
  Scenario: User fails to log in with empty credentials 
    Given I make a POST request to /login
    And I set body to
      """
      {
        "email": "",
        "password": ""
      }
      """
    When I receive a response
    Then I expect response should have a status 400
    And I expect response should have a json like
      """
        {
          "message": "Email is missing"
        }
      """
  
  Scenario: User fails to log in with empty password 
    Given I make a POST request to /login
    And I set body to
      """
      {
        "email": "$M{ENV.RS_EMAIL}",
        "password": ""
      }
      """
    When I receive a response
    Then I expect response should have a status 400
    And I expect response should have a json like
      """
        {
          "message": "Password is missing"
        }
      """
