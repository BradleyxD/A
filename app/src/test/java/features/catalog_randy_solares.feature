Feature: Consulta detalle de un catalogo admin.

Background:
    * url urlCommons
    * def testuser1 = callonce read("classpath:helpers/security/authorize.feature") {"username":testuser1}

@administration @catalog @rsolares
Scenario: Consulta el detalle de un catalogo.
    Given path "/administration/v1/catalog/EXECUTION_TYPES/detail"
    * header Authorization = "Bearer " + testuser1.accessToken
    * request {}
    When method post
    Then status 200
    * match each response..catalogCode == "EXECUTION_TYPES"
    * match response.data.record.total == "#number"
    * match response.data.record.count == "#number"