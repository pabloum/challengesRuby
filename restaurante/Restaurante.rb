# Incluyendo los modulos Menu, Ordenes, Caja una instancia de Restaurantes debe poder:

#     Registrar una orden y agregar productos a la orden a partir de la disponibilidad del menu.
#     Se debe poder pagar un pedido.

# Escriba la interfaz (en un archivo aparte) desde lacual se correrá el programa.

class Restaurante
    include Menu
    include Ordenes
    include Caja

    def initialize
      cargar_menu
    end

    def pagar_pedido

    end

end
