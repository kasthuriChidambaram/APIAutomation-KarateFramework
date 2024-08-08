package Booking;

import com.intuit.karate.junit5.Karate;

public class HotelBookingRunnerTest {
    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@regression").relativeTo(getClass());
    }
}
