Feature: Servicio para listar todos los catálogos y su metadata.

Background:
    * url urlCommons
    * def testuser1 = callonce read("classpath:helpers/security/authorize.feature") {"username":testuser1}

@administration @catalog @marvin
Scenario: Consulta del detalle para el catálogo ACH_BANKS
    Given path "/administration/v1/catalog/ADDITIONAL_INCOME/detail"
    * header Authorization = "Bearer " + testuser1.accessToken
    * request {}
    When method post
    Then status 200
    * match response.code == "SUCCESSFUL_OPERATION"
    * match each response..catalogCode == "ADDITIONAL_INCOME"
    * match response..items..code contains only ["1","10","11","12","13","14","15","16","17","18","19","2","4","5","7","9"]
    * match response..value contains only ["REMESAS","OTROS","ECONOMIA INFORMAL","VENTAS/PRESTACION DE PRODUCTOS/SERVICIOS","DONACIONES","ASIGNACION PRESUPUESTARIA","APORTACIONES","FINANCIAMIENTO","UTILIDADES","SUBVENCIONES","RENTAS","ALQUILERES/RENTA","PENSION ALIMENTICIA","JUBILACION","SERVICIOS PROFESIONALES","MANUTENCION"]
    * match each response..father == ""
    * match each response..class == ""
    * match each response..active == "true"
    * match each response..items..catalog_code == "OTHER_SOURCE_INCOME"
    
