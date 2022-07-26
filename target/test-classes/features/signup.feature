@OutPractice
Feature: sing up and register an account with azure website

  Background: Generate token
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generatedToken = response.token

  Scenario: Create an account
    And path "/api/accounts/get-primary-account"
    Then param primaryPersonId = 1347
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    Then print response
    
    #Scenario: delete an account from data  base
    #And  path "/api/accounts/delete-account"
    #And param primaryPersonId = 1342
    #And header Authorization = "Bearer " + generatedToken
    #When method delete
    #Then status 200
    #And  print response
    
    
    
    
    
