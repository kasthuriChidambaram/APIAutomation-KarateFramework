package Booking;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

public class HotelBookingRunnerTest {


 /*   @Karate.Test
  //Non Parallel execution took 28 seconds to complete the regression run
    Karate testTags() {
        return Karate.run().tags("@regression").relativeTo(getClass());
    }*/

    @Test
        //Parallel execution took 16 seconds to complete the regression run
    void testParallel() {
        Results results = Runner.path("classpath:Booking").tags("@regression").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
