require_relative "modulos.rb"

class Restaurante
    include Menu
    include Ordenes
    include Caja
    attr_reader :ordenes

    @@clientes = 0

    def initialize
      menu = cargar_menu
      # @ordenes = OrdenesClass.new(menu)
      @pago = false
      @@clientes += 1
      @cliente = "Cliente #{@@clientes}"
    end

    # def crea_orden
    #   @ordenes.crea_orden
    # end

    def

end
