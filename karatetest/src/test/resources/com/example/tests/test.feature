@user
Feature: Another feature

  Scenario: Sample scenario
    Given url 'https://jsonplaceholder.typicode.com/todos/2'
    When method get
    Then status 200
