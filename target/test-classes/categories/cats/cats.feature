Feature: Getting category

  Background:
    * url 'https://api.thedogapi.com/v1/'
    * header x-api-key = 'live_MZuFF20RpOAJWlFt5JIzSvxBEl2V67khyaEE6EhPeSCEmcypCk1LoOjtBI5WD7UD'
    * header 'Content-Type' = 'application/json'

  Scenario: test that I can Get  categories
    Given path 'categories'
    When method get
    Then status 200
