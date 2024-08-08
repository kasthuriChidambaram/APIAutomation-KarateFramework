@partialupdate @regression
Feature:Partiaaly Update Booking details with booking id

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

  Scenario: Partially Update the booking by providing the booking id

    #update booking
    * def partailbookingdetails =
    """
    {
      "additionalneeds" : "Dinner only"
    }
    """

    Given path 'booking',bookingid
    And request partailbookingdetails
    And header Accept = 'application/json'
    And header Cookie = 'token=' + authToken
    When method patch
    Then status 200
    * def expected = partailbookingdetails.additionalneeds
    * def actual = response.additionalneeds
    * match expected == actual







