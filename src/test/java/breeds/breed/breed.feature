Feature: Get, post, and delete calls for breeds

  Background:
    * url 'https://api.thedogapi.com/v1'
    * header x-api-key = 'live_MZuFF20RpOAJWlFt5JIzSvxBEl2V67khyaEE6EhPeSCEmcypCk1LoOjtBI5WD7UD'
    * header 'Content-Type' = 'application/json'

  Scenario: verify that I can Get breeds by limit
    * param limit = 10;
    Given path 'breeds/limit'
    When method get
    Then status 200
    And eval karate.log('Response:', response)
    Then print response

  Scenario: verify that I can Get breeds by id
