Feature: User

  Scenario: Get user details with valid jwt token
    Given I make a GET request to /getUser
    And I set bearer token to $S{ID_TOKEN}
    When I receive a response
    Then I expect response should have a status 200
    And I expect response should have a json like
    """
      {
        "enforcedMfa": false,
        "canSetupMfa": true,
        "workspaces": [
            {
                "name": "usoplay-yafebig215",
                "environment": "PRODUCTION",
                "isDefault": true,
                "roles": [],
                "defaultRegion": "US",
                "status": "ACTIVE"
            }
        ],
        "organizations": [
            {
                "name": "usoplay-yafebig215",
                "role": "admin"
            }
        ],
        "phoneNumber": null,
        "mfaStatus": null,
        "email": "$M{ENV.RS_EMAIL}",
        "name": "Yaf",
        "provider": null,
        "providerUserId": null,
        "pendingTasks": []
      }
    """

  Scenario: Get user details with invalid jwt token
    Given I make a GET request to /getUser
    And I set bearer token to random-id
    When I receive a response
    Then I expect response should have a status 401