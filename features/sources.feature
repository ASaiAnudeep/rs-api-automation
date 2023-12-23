Feature: Sources

  Scenario: Create a javascript source
    Given I make a POST request to /workspaces/2Zvg9W7WdKnj0M4OQCnQMTY6PA8/sources
    And I set bearer token to $S{ID_TOKEN}
    And I set body to
      """
      {
        "name": "test",
        "sourceDefinitionId": "1TW48i2bIzEl1HPf825cEznfIM8",
        "workspaceId": "2Zvg9W7WdKnj0M4OQCnQMTY6PA8",
        "accountId": null,
        "config": {}
      }
      """
    When I receive a response
    Then I expect response should have a status 200
    And I store response at id as SOURCE_ID
    And I delete source

  Scenario: Create a webhook source
    Given I make a POST request to /workspaces/2Zvg9W7WdKnj0M4OQCnQMTY6PA8/sources
    And I set bearer token to $S{ID_TOKEN}
    And I set body to
      """
      {
        "name": "test-wh",
        "sourceDefinitionId": "1wJ48CjxXYRhxm83W8xFGTQygxt",
        "accountId": null,
        "config": {}
      }
      """
    When I receive a response
    Then I expect response should have a status 200
    And I store response at id as SOURCE_ID
    And I delete source
  
  Scenario: Creation of the source should be unsuccessful with missing body
    Given I make a POST request to /workspaces/2Zvg9W7WdKnj0M4OQCnQMTY6PA8/sources
    And I set bearer token to $S{ID_TOKEN}
    When I receive a response
    Then I expect response should have a status 400 
    And I expect response should have a json like
      """
        {
          "message": "Source Name cannot be empty"
        }
      """

  Scenario: Creation of the source should be unsuccessful when an invalid source ID
    Given I make a POST request to /workspaces/2Zvg9W7WdKnj0M4OQCnQMTY6PA8/sources
    And I set bearer token to $S{ID_TOKEN}
    And I set body to
      """
      {
        "name": "test-wh",
        "sourceDefinitionId": "abc",
        "workspaceId": "2Zvg9W7WdKnj0M4OQCnQMTY6PA8",
        "accountId": null,
        "config": {}
      }
      """
    When I receive a response
    Then I expect response should have a status 404
    And I expect response should have a json like
      """
        {
          "message": "Source Definition does not exist"
        }
      """