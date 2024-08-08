@ignore
Feature:Post booking operations in Booking API

  Background:
    * url baseurl

  Scenario:Create booking
    Given path 'booking'
    When request __arg
    And header Accept = 'application/json'
    And method Post
    Then status 200
