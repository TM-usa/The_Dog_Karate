package votes.vote;

import com.intuit.karate.junit5.Karate;

public class voteRunner {
    @Karate.Test
    Karate testvote() {
        return Karate.run("vote").relativeTo(getClass());
    }
}
