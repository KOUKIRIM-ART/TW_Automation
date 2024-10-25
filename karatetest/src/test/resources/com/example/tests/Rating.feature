Feature:
  Background:
    * configure ssl = true
    * def tokens = call read('classpath:com/example/tests/Token.feature@access_token')
    * def response = karate.response


  Scenario:
    Given url 'https://rating-backend-rec.ivs-hp.be-ys.com/pivot/realtime'
  # Replace with actual base URL
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + tokens.access_token

    #Define the request body
    * def guid = karate.get('guid')
    * print 'Guid:', guid
    * def benefId = guid
    * def prestation = guid
    * print 'benefId set to:', benefId
    * print 'prestation set to:', prestation
    And def requestBody =
      """
    {"bundleMessageType": "","applyAllControls": true,
    "bundle": { "technicalIdentifier": "{{$guid}}",
    "technicalDetails": { "transmissionMethod": {  "system": "https://www.almerys.com/norme/INCAP"  },
    "bundlesCount": 1,   "metadata": {"data": { "Sphere": "AG2R"}}},
      "businessIdentifier": "f5e5539a-f0cf-44cb-9dd9-419e93b040c2 | 9477080e-e3b7-36bf-bb69-cec6688698f0",
    "creation": "2024-08-01T00:00:00Z",
    "claims": [ { "technicalIdentifier": "bbc04d1c-870b-4d24-9f4c-9df021c82fc0",
      "patient": {"identifiers": [  { "value": "{{benefId}}","type": { "codings": null, "text": "internalId"}} ],
    "birthDetails": {   "date": "1987-03-08"},
    "naturalPerson": [
    { "value": "e4f58564-9f06-37cd-a5b9-6ffc493da98a-fa2a0386-7342-4316-b40d-29eabb31fae3",
    "type": { "codings": null, "text": "internalId"  }}]},
    "items": [  { "_class": "com.almerys.preliquidation.canonicalformat.claim.response.ClaimResponseItem",
    "sequence": 1, "period": {   "start": "2023-03-15T00:00:00Z"  },
    "actCode": { "system": "https://www.almerys.com/norme/INCAP",
    "code": "MENSU"  },  "patient": { "_class": "com.almerys.preliquidation.canonicalformat.claim.Member",
        "identifiers": [  {   "value": "{{benefId}}", "type": { "codings": null,"text": "internalId" }}   ] },
      "filters": [] } ], "filters": [], "status": "ACTIVE",
      "metadata": { "data": { "ClaimType": "RC",  "flowType": "FLUX_ASSURE" } },
      "occurrence": {  "period": { "start": "2023-03-15T00:00:00Z"},"declarationDate": "2023-03-15T00:00:00Z" } } ],
      "modelVersion": "2.12.15","obfuscated": false},"run": 1,
    "exchangeProcessingEntryIdentifier": "", "bundleIdentifier": "47faae7e-c845-4fae-913a-eb37f0a10aea",
      "creation": "2024-08-01T06:24:32.441Z","precalculate": true,"calculate": false,"mode": "PREST",
      "count": false,"returnAllDetails": true}
      """
  # Send the POST request
    When method POST
    When request requestBody
    * print 'Response Status:', response.status
    * print 'Response Body:', response
    #Then assert response.status == 200


