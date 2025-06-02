Feature: Servicio para listar todos los catálogos de tipos de productos.

Background:
    * url urlCommons
    * def testuser1 = callonce read("classpath:helpers/security/authorize.feature") {"username":testuser1}

@administration @catalog @GenesisMorales
Scenario: Consulta del detalle para el catálogo PRODUCTS_TYPES
    Given path "/administration/v1/catalog/PRODUCTS_TYPES/detail"
    * header Authorization = "Bearer " + testuser1.accessToken
    * request {}
    When method post
    Then status 200
    #se verifica que todo el listado parámetros catalogCode presenten el mosmo valor PRODUCTS_TYPES
    * match response.code == "SUCCESSFUL_OPERATION"
    #se verifica que el listado de valores de los parámetros product_type_id contenga solo los valores del listado.
    * match response..product_type_id contains only [20, 3, 4]
    * match each response..items..order == "#number"
    * match each response..items..id == "#uuid"
    * match each response..items..name == "#string"
    * match each response..items..name contains only ["Tarjeta de crédito","Monetario","Ahorro"]