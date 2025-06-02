Feature: Consulta detalle de un catalogo EXTRA_FINANCING_DEADLINES.

  Background:
    * url urlCommons
    * def testuser1 = callonce read("classpath:helpers/security/authorize.feature") {"username":testuser1}

  @administration @catalog @mrodriguez
  Scenario: Consulta el detalle del catalogo EXTRA_FINANCING_DEADLINES.
    Given path "/administration/v1/catalog/EXTRA_FINANCING_DEADLINES/detail"
    * header Authorization = "Bearer " + testuser1.accessToken
    * request {}
    When method post
    Then status 200
    * match response.code == "SUCCESSFUL_OPERATION"
    * match each response..catalogCode == "EXTRA_FINANCING_DEADLINES"
    * match response..items..period contains only ["3","6","12","18","24","36","48"]
    * match response..items..id contains only ["1","2","3","4","5","6","7"]
    * match response..items..active contains only [true,true, true, true,true,true,true]

