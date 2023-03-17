Feature: Get, post, and delete calls

  Background:
    * url 'https://api.thedogapi.com/v1'
    * header x-api-key = 'live_MZuFF20RpOAJWlFt5JIzSvxBEl2V67khyaEE6EhPeSCEmcypCk1LoOjtBI5WD7UD'
    * header 'Content-Type' = 'application/json'

  Scenario: verify that I can Get a favorite by favourite Id
    Given path 'favourites/1'
    When method get
    Then status 200
    And match response.sub_id == 'my-user-1234'
    And match response.id == 1
    And eval karate.log('Response:', response)
    Then print response


  Scenario: verify that i can save a favorite with image id
    Given path 'favourites'
    And header 'Content-Type' = 'application/json'
    And request {image_id: 'HkRcZe547'}
    When method post
    Then status 200
    And match response.message == "SUCCESS"
    And eval karate.log('Response:', response)
    And karate.log("created dog saved!");

  Scenario: verify that i can create a favorite with image id and Sub id successfully

    * def jsonObject =
    """
    {
	"image_id":"Thapelo123",
	"sub_id": "my-user-1234"
    }

    """

    Given path 'favorites'
    When request  jsonObject
    And header Accept = 'application/json'
    When method post
    Then status 200


  Scenario: verify that I can delete favorite by ID
    Given path 'favourites/1'
    And header 'Content-Type' = 'application/json'
    When method delete
    Then status 400
    And eval karate.log('Response:', response)