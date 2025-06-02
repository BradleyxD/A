Feature: Access Authorize Code

  Background:
    * url urlCommons
    * def auth = call read('classpath:helpers/scripts/Authorization.js') username

  Scenario: Request Authorize Code
    Given path '/security/v1/auth/authorize'
    And request
    """
    {
      "client_id": "#(auth.client_id)",
      "response_type": "legacy",
      "username": "#(username)",
      "password": "#(auth.password)"
    }
    """
    When method post
    Then status 200
    And match response.token_type == 'bearer'
    * karate.match(response.access_token, '/^[A-Za-z0-9-_]+\.[A-Za-z0-9-_]+\.[A-Za-z0-9-_]+$/')
    * def accessToken = response.access_token