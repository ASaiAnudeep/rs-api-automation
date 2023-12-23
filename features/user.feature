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
                "id": "2Zvg9W7WdKnj0M4OQCnQMTY6PA8",
                "name": "usoplay-yafebig215",
                "organizationId": "2Zvg9WbrtOQ0Pbizjd5gTMrQYKw",
                "environment": "PRODUCTION",
                "isDefault": true,
                "roles": [],
                "defaultRegion": "US",
                "status": "ACTIVE"
            }
        ],
        "organizations": [
            {
                "id": "2Zvg9WbrtOQ0Pbizjd5gTMrQYKw",
                "name": "usoplay-yafebig215",
                "role": "admin"
            }
        ],
        "phoneNumber": null,
        "mfaStatus": null,
        "email": "$M{ENV.RS_EMAIL}",
        "id": "2ZvfqYU9VKuVjSWAOTXXN0gSOK1",
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