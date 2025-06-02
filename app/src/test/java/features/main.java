package features;

import com.intuit.karate.junit5.Karate;

class FeatureTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass()).outputCucumberJson(true);
    }
}