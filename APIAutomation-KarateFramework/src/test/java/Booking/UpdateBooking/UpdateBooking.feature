@updatebooking @regression
Feature:Update Booking details with booking id

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

  Scenario: Update the booking by providing the booking id

    #update booking
    * set passengerbooking.totalprice = 100

    Given path 'booking',bookingid
    And request passengerbooking
    And header Accept = 'application/json'
    And header Cookie = 'token=' + authToken
    When method put
    Then status 200
    * def expectedTotalPrice = passengerbooking.totalprice
    * def actualTotalPrice = response.totalprice
    * match expectedTotalPrice == actualTotalPrice







