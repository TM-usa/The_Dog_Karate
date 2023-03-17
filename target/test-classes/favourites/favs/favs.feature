Feature: Getting a favorite by ID

  Background:
    * url 'https://api.thedogapi.com/v1'
    * header x-api-key = 'live_MZuFF20RpOAJWlFt5JIzSvxBEl2V67khyaEE6EhPeSCEmcypCk1LoOjtBI5WD7UD'
    * header 'Content-Type' = 'application/json'

  Scenario: test that I can Get a favorite by favourite Id
    Given path 'favourites/70443'
    When method get
    Then status 200
    And match response.sub_id == 'my-user-1234'
    And match response.id == 70443

    And eval karate.log('Response:', response)
    Then print response


  Scenario: test that i can create a favorite with image id
    Given path 'favourites'
    And header 'Content-Type' = 'application/json'
    And request {image_id: '12g3fg45'}
    When method post
    Then status 200
    And match response.message == "SUCCESS"
    And eval karate.log('Response:', response)
    And karate.log("created dog saved!");


  Scenario: test that I can delete favorite by ID
    Given path 'favourites/70379'
    And header 'Content-Type' = 'application/json'
    When method delete
    Then status 400
    And eval karate.log('Response:', response)