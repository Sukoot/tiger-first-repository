Feature: api user profile

  Background: Generate token
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generatedToken = response.token

  Scenario: Create new Profile
    And path "/api/user/prifile"
    And header Authorization = "Bearer " + token
    And request
      """
      {
       "id": 0,
       "email": "string",
       "title": "string",
       "firstName": "string",
       "lastName": "string",
       "gender": "MALE",
       "maritalStatus": "MARRIED",
       "employmentStatus": "string",
       "dateOfBirth": "2022-07-25T13:46:11.681Z",
       "user": {
         "id": 0,
         "fullName": "string",
         "username": "string",
         "accountType": "CSR",
         "authorities": [
           {
             "id": 0,
             "role": "string",
             "users": [
               "string"
             ]
           }
         ],
         "accountNonExpired": true,
         "accountNonLocked": true,
         "credentialsNonExpired": true,
         "enabled": true,
         "primaryPerson": "string"
       }
      }
      """
    When method get
    Then status 200
    And print response
