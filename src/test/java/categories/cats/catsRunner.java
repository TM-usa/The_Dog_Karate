package categories.cats;

import com.intuit.karate.junit5.Karate;

public class catsRunner {
    @Karate.Test
    Karate testCats() {
        return Karate.run("cats").relativeTo(getClass());
    }

}
