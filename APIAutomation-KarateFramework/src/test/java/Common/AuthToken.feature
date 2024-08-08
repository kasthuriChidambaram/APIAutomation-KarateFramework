@ignore
Feature:Get Authorization Token

  Background:
    * url baseurl

    Scenario: Get token
    Given path 'auth'
    And request {"username": "admin","password": "password123"}
    When method Post
    Then status 200

