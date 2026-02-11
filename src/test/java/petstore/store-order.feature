Feature: Gestión de órdenes en PetStore

  Background:
    * url baseUrl
    * def orderId = Math.floor(Math.random() * 10000)
    * configure ssl = true

# =======================
# AP – Preparación
# =======================
  Scenario: Crear una orden base para pruebas
    Given path '/store/order'
    And request
    """
    {
      "id": #(orderId),
      "petId": 1,
      "quantity": 1,
      "status": "placed",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match response.id == orderId

# =======================
# HP – Happy Path
# =======================
  Scenario: Obtener una orden existente
    Given path '/store/order', orderId
    When method get
    Then status 200
    And match response.id == orderId
    And match response.status == 'placed'

  Scenario: Eliminar una orden existente
    Given path '/store/order', orderId
    When method delete
    Then status 200

# =======================
# NP – Negative Path
# =======================
  Scenario: Consultar una orden eliminada
    Given path '/store/order', orderId
    When method get
    Then status 404
