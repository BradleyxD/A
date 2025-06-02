Feature: Servicio para listar todos los catálogos y su metadata.

Background:
    * url urlCommons
    * def testuser1 = callonce read("classpath:helpers/security/authorize.feature") {"username":testuser1}

@administration @catalog @CarlosMendez
Scenario: Consulta del detalle para el catálogo ACH_BANKS
    Given path "/administration/v1/catalog/PRODUCTS_TYPES_ACH/detail"
    * header Authorization = "Bearer " + testuser1.accessToken
    * request {}
    When method post
    Then status 200
    * match response == {"code":"SUCCESSFUL_OPERATION","message":"Successful Operation","data":{"record":#object}}
    * match response.data.record.items == "#array"
    #se verifica que todo el listado parámetros catalogCode presenten el mosmo valor PRODUCTS_TYPES_ACH
    * match each response..catalogCode == "PRODUCTS_TYPES_ACH"
    * match each response..active == true
    #se verifica que el listado de valores de los parámetros product_type_id contentan solo los valores del listado.
    * match response..product_type_id contains only ["20", "7", "3", "4"]
    * match each response..order == "#number"
    * match each response..id == "#uuid"
    * match each response..name == "#string"
    * match response.data.record.total == "#number"
    * match response.data.record.count == "#number"
    * match response.data.record.limit == 200
    * match response.data.record.offset == 0