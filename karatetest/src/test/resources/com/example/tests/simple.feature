@product
Feature: Sample Feature

  Scenario: Sample Scenario
    Given url 'https://jsonplaceholder.typicode.com/todos/1'
    When method get
    Then status 200
