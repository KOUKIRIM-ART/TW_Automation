package com.example.tests;  // Assure-toi que ce package est correct

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testAll() {
        // Utilisation de .feature files "Token" et "Rating", relatifs à cette classe
        return Karate.run( "classpath:com/example/tests/Rating.feature");

    }
}
