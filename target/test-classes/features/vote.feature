Feature: Getting, posting and deleting votes

  Background:
    * url 'https://api.thedogapi.com/v1'
    * header x-api-key = 'live_MZuFF20RpOAJWlFt5JIzSvxBEl2V67khyaEE6EhPeSCEmcypCk1LoOjtBI5WD7UD'
    * header 'Content-Type' = 'application/json'

  Scenario Outline: verify that I can Get a votes by  sub id
    *param sub_Id <sub_id>
    Given path 'votes'
    When method get
    Then status 200

    Examples:
      | sub_id |
      | 'null' |
      | 'test' |



  Scenario: verify that I can Get a vote by  Id
    Given path 'votes/145520'
    When method get
    Then status 200
    And match response.name == 'African Hunting Dog'
    And match response.id == 145520
    And eval karate.log('Response:', response)
    Then print response


  Scenario: verify that I can post up

  Scenario: create new up vote and get it by sub_id
    * def jsonVoteUp =
    """
   {
	"image_id":"asfiehhyg2",
	"sub_id": "my-the-user-1234",
	"value":1
}

    """

    Given path 'favorites'
    When request  jsonVoteUp
    And header Accept = 'application/json'
    When method post
    Then status 201

    * def sub_id = response.sub_id
    * print 'created sub_id: ', sub_id
    Given path sub_id
    When method get
    Then status 200
    And match response contains jsonVoteUp 





  Scenario: verify that I can post down

    * def jsonVoteDown =
    """
{
	"image_id":"asghf2",
	"sub_id": "my-user-123445",
	"value":0
}

    """

    Given path 'favorites'
    When request  jsonVoteUp
    And header Accept = 'application/json'
    When method post
    Then status 201

    * def value = response.value
    * print 'created value: ', value
    Given path value
    When method get
    Then status 200
    And match response contains jsonVoteDown 




  Scenario: verify that I can delete vote by id

    Given path 'votes/145519'
    And header 'Content-Type' = 'application/json'
    When method delete
    Then status 400
    And eval karate.log('Response:', response)


