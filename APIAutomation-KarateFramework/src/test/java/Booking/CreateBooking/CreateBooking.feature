@createbooking @regression
Feature: Create booking

  Background:
    * configure url = baseurl

  Scenario:Crete booking for the give passenger details

   * def passengerDetail =
     """
   {
   "firstname" : "Jim",
   "lastname" : "Brown",
   "totalprice" : 111,
   "depositpaid" : true,
   "bookingdates" : {
   "checkin" : "2024-07-08",
   "checkout" : "2024-07-10"
   },
   "additionalneeds" : "Breakfastt"
   }
     """
     Given path 'booking'
     When request passengerDetail
     And header Accept = 'application/json'
     And  method Post
     Then status 200
     * match response contains { bookingid: '#number', booking: '#(passengerDetail)' }
     * def bookingid = response.bookingid


