Feature: Events

  Scenario: Create a identify event
    Given I make a POST request to $M{ENV.RS_DATA_PLANE_URL}/v1/identify
    And I set source write key $M{ENV.RS_SOURCE_WRITE_KEY}
    And I set body to
      """
      {
        "userId": "user_123",
        "context": {
          "traits": {
            "trait1": "new-val"  
          },
          "ip": "14.5.67.21",
          "library": {
            "name": "http"
          }
        }
      }
      """
    When I receive a response
    Then I expect response should have a status 200

  Scenario: Create a track event
    Given I make a POST request to $M{ENV.RS_DATA_PLANE_URL}/v1/track
    And I set source write key $M{ENV.RS_SOURCE_WRITE_KEY}
    And I set body to
      """
      {
        "userId": "user_123",
        "event": "Product Purchased",
        "properties": {
          "name": "Rubik's Cube",
          "revenue": 4.99
        },
        "context": {
          "ip": "14.5.67.21"
        }
      }
      """
    When I receive a response
    Then I expect response should have a status 200
  
  Scenario: Get events
    Given I make a GET request to /workspaces/2Zvg9W7WdKnj0M4OQCnQMTY6PA8/sources/2ZvhRAwdrJ3PnRtTNTggCiqA1Jy/events
    And I set bearer token to $S{ID_TOKEN}
    And I set query param start to $F{GetDate:-1,day}
    And I set query param end to $F{GetDate:-1,minute}
    When I receive a response
    Then I expect response should have a status 200