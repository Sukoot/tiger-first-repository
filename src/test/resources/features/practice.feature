@End2EndTest 
 Feature: api end to end test

  Scenario: Generate token create new account add address, phone number,and car to this account and update the car make
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def createdToken = response.token
    
    And path "/api/accounts/add-primary-account"
    * def getMethod = Java.type('practice.faker.FakerData')
    * def email = getMethod.getEmail()
    * def name = getMethod.getName()
    * def lastName = getMethod.getLastName()
    * def DOB = getMethod.getDOB()
    * def phoneNumber = getMethod.getPhoneNumber()
    * def address = getMethod.getStreetAdderss()
    * def city = getMethod.getCityName()
    * def state = getMethod.getStateName()
    And request
      """
      {
      "email": "#(email)",
      "firstName": "#(name)",
      "lastName": "#(lastName)",
      "title": "Mrs.",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "Student",
      "dateOfBirth": "#(DOB)",
      "new": true
      }

      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    * def dynamicId = response.id
    * def result = response.email
    Then assert result == email
    * def Results = response.lastName
    Then assert Results == lastName
    
    And path "/api/accounts/add-account-address"
    And param primaryPersonId = dynamicId
    And request
      """
      {
      "id": 0,
      "addressType": "Home",
      "addressLine1": "#(address)",
      "city": "#(city)",
      "state": "#(state",
      "postalCode": "22153",
      "countryCode": "string",
      "current": true
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    * def verify = response.city
    Then assert verify == city
    
    And path "/api/accounts/add-account-phone"
    And param primaryPersonId = dynamicId
    And request
      """
      {
      "id": 0,
      "phoneNumber": "#(phoneNumber)",
      "phoneExtension": "009",
      "phoneTime": "AnyTime",
      "phoneType": "Home"
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    * def verified = response.phoneNumber
    Then assert verified == phoneNumber
    
    And path "/api/accounts/add-account-car"
    And param primaryPersonId = dynamicId
    And request
      """
      {
      "id": 0,
      "make": "Toyota",
      "model": "Highlander",
      "year": "2018",
      "licensePlate": "Va123"
      }

      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    * def verifies = response.model
    Then assert verifies == "Highlander"
    # we update the car make
    And path "/api/accounts/update-account-car"
    And param primaryPersonId = dynamicId
    And request
    """
    {
  "id": 0,
  "make": "Tesla",
  "model": "Highlande",
  "year": "2018",
  "licensePlate": "Va123"
}
    
    """
    And header Authorization = "Bearer " + createdToken
    When method put
    Then status 200
    And print response
    
    #
    
    
    
 
    
