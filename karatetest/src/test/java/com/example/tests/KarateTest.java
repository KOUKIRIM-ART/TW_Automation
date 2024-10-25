package com.example.tests;

import com.intuit.karate.junit5.Karate;

class KarateTest {

    @Karate.Test
    Karate testAll() {
        // Inclure plusieurs fichiers feature
        return Karate.run("simple","test").relativeTo(getClass());



    }
}
