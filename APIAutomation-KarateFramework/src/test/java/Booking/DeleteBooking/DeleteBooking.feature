@deletebooking @regression
Feature:Delete operation in Booking API

  Background:
    * configure url = baseurl

    * def result = call read('classpath:Common/AuthToken.feature')
    * def authToken = result.response.token

    * def passengerbooking =
      """
      {
        "firstname" : "Vellamal",
        "lastname" : "selvam",
        "totalprice" : 101,
        "depositpaid" : true,
        "bookingdates" : {
          "checkin" : "2024-07-04",
          "checkout" : "2024-07-08"
        },
        "additionalneeds" : "Dinner and Breakfast"
      }
      """

    # create booking
    * def result = call read('classpath:Common/PostBooking.feature') passengerbooking
    * def bookingid = result.response.bookingid

  Scenario: Delete the booking by providing the booking id

    Given path 'booking',bookingid
    And header Cookie = 'token=' + authToken
    When method delete
    Then status 201

    #Verify that the booking has beenn deleted by sending a get request with the deleted booking id
    Given path 'booking',bookingid
    And header Accept = 'application/json'
    When method Get
    Then status 404


