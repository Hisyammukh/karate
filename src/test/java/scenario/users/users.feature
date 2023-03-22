Feature: sample karate test script
  # for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url users.baseUrl
    * def responseScheme = read("classpath:common/responses/data-scheme.json")

  Scenario: get all users and then get the first user by id
    Given path 'posts'
    When method GET
    Then status 200
    And def user = responseScheme.users.user
    And match response == responseScheme.users.users

  @p0
  Scenario: create a user and then get it by id
    * def user =
      """
      {
        "title": "recommendation",
        "body": "motorcycle",
        "userId" : 2
      }
      """

    Given path 'posts'
    And request user
    When method POST
    Then status 201
    And match response.userId == user.userId
    And match response.title == user.title
    And match response.body == user.body
