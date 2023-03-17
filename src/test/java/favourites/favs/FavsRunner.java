package favourites.favs;

import com.intuit.karate.junit5.Karate;

class FavsRunner {

    @Karate.Test
    Karate testFavs() {
        return Karate.run("favs").relativeTo(getClass());
    }

}