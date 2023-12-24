Feature: Events

  Scenario: Configure Source and Destination
    Given I have a source
    And I have a destination
    And I record total sent events as INIT_SENT_EVENTS
    And I record total delivered events as INIT_DELIVERED_EVENTS

  Scenario: Create a identify event
    Given I make a POST request to $M{ENV.RS_DATA_PLANE_URL}/v1/identify
    And I set source write key $S{SOURCE_WRITE_KEY}
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
    And I set source write key $S{SOURCE_WRITE_KEY}
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
  
  Scenario: Validate sent events count
    Given I wait for 90000 ms
    And I record total sent events as NEW_SENT_EVENTS
    And I record total delivered events as NEW_DELIVERED_EVENTS
    Then total sent events should be increased by 2
    And total delivered events should be increased by 2