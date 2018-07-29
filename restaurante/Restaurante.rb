require_relative "modulos.rb"

class Restaurante
    include Menu
    include Ordenes
    include Caja

    @@clientes = 0

    def initialize
      cargar_menu
      @pago = false
      @@clientes += 1
      @cliente = "Cliente #{@@clientes}"
    end

end
