Feature:  Retrieve keycloak access token for REST APIs Authentication
  Background:
    * configure ssl = true

  @access_token
  Scenario: Testing auth
    Given url 'https://api-rcc.be-ys.com/auth/realms/BCU_INT/protocol/openid-connect/token'
    And form field username = 'ref-admin'
    And form field password = 'Almerys0'
    And form field client_id = 'preRating-back'
    And form field grant_type = 'client_credentials'
    And form field client_secret = '6yuPoGl42tgiN72vDcZjCefV3RulZKJW'
    When method POST
    Then status 200
    * def access_token = response.access_token
