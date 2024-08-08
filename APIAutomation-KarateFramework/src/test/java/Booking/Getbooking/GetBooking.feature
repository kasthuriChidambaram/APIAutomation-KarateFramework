@getbooking @regression
Feature:Get operations in Booking API

  Background:
    * url baseurl
    * def passengerbooking =
      """
      {
        firstname: 'Sara', lastname: 'kannan',
        totalprice: 1000, depositpaid: true,
        additionalneeds: 'Lunch and Dinner',
        bookingdates: { checkin: '2024-07-01', checkout: '2024-07-05' }
      }
      """
    # create booking
    * def result = callonce read('classpath:Common/PostBooking.feature') passengerbooking
    * def bookingid = result.response.bookingid


  Scenario: Get all the Bookings details
    Given path 'booking'
    When method Get
    Then status 200
    * match response contains { bookingid: '#number'}


  Scenario: Get the booking details by providing passenger name
    Given path 'booking'
    And param firstname = 'Sara'
    And param lastname = 'kannan'
    When method Get
    Then status 200
    * match response contains { bookingid: '#(bookingid)' }

  Scenario: Get the booking details by proving booking id

    Given path 'booking'
    And path bookingid
    And header Accept = 'application/json'
    When method Get
    Then status 200
    * match response == passengerbooking



