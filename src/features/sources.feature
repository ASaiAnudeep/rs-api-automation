Feature: Sources

  Scenario: Create a javascript source
    Given I make a POST request to /workspaces/$S{WORKSPACE_ID}/sources
    And I set bearer token to $S{ID_TOKEN}
    And I set body to
      """
      {
        "name": "test-js",
        "sourceDefinitionId": "$S{SOURCE_DEFINITIONS[name=Javascript].id}",
        "accountId": null,
        "config": {}
      }
      """
    When I receive a response
    Then I expect response should have a status 200
    And I store response at id as SOURCE_ID
    And I delete a source

  Scenario: Create a webhook source
    Given I make a POST request to /workspaces/$S{WORKSPACE_ID}/sources
    And I set bearer token to $S{ID_TOKEN}
    And I set body to
      """
      {
        "name": "test-wh",
        "sourceDefinitionId": "$S{SOURCE_DEFINITIONS[name=webhook].id}",
        "accountId": null,
        "config": {}
      }
      """
    When I receive a response
    Then I expect response should have a status 200
    And I store response at id as SOURCE_ID
    And I delete a source
  
  Scenario: Creation of the source should be unsuccessful with missing body
    Given I make a POST request to /workspaces/$S{WORKSPACE_ID}/sources
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
    Given I make a POST request to /workspaces/$S{WORKSPACE_ID}/sources
    And I set bearer token to $S{ID_TOKEN}
    And I set body to
      """
      {
        "name": "test-wh",
        "sourceDefinitionId": "abc",
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