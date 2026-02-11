package petstore;

import com.intuit.karate.junit5.Karate;

class Runner {
    
    @Karate.Test
    Karate runAll() {
        return Karate.run("store-order").relativeTo(getClass());
    }    

}
