package breeds.breed;

import com.intuit.karate.junit5.Karate;

public class breedRunner {
    @Karate.Test
    Karate testCats() {
        return Karate.run("breed").relativeTo(getClass());
    }

}
