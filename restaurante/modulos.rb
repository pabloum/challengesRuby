# ~ Documents/Ruby/restaurante
require "pry-nav"

module Menu

    def cargar_menu
        @@menu = (IO.readlines("menu.txt"))
        @@menu.map! { |c| c.split(" ")  }
    end

    def mostrar_menu
        @@menu.each_with_index do |e,i|
            print "#{e[0]}\t|  #{e[1]}\t|\t#{e[2]}\t|\t#{e[3]}"
            puts " "
            puts "------------------------------------------------------------" if i ==0
        end
        puts " "
    end

    def agregar_producto(datos=["020","Perro","10000",true])
        codigo = datos[0]
        nombre = datos[1]
        precio = datos[2]
        dispo  = datos[3]
        producto = "#{codigo}\t\t\t#{nombre}\t\t\t    #{precio}\t\t#{dispo}\n"
        File.open("menu.txt", 'a') { |file| file.puts(producto) }
        @@menu << [codigo,nombre,precio,dispo]
    end

    def consulta_codigo(code = "001")
        nombre = precio = dispo = nil;
        @@menu.each do |i|
          if i[0] == code
            nombre = i[1]
            precio = i[2]
            dispo = i[3]
          end
      end
      [nombre, precio, dispo]
    end
end

# Crear una orden y que se le pueda agregar productos
# Mostrar el total de la orden.
# Mostrar todas las ordenes en cola.

module Ordenes
    # include Menu
    class OrdenesClass
      @@ordenes_cola = []

      def initialize(menu)
        @@menu = menu
      end

      def crea_orden(new_order=nil)
            @orden = []
            existe = false

            @@menu.each do |i|
                existe = i.include?(new_order)
                break if existe
            end

            if (consulta_codigo(new_order)[2] == "true" && existe)
                @orden << new_order
                @@ordenes_cola << consulta_codigo(new_order)[0]
            else
                puts "No tenemos este producto disponible"
            end
      end

      def agregar_pedido(pedido="007")
            existe = false
            @@menu.each do |i|
                existe = i.include?(pedido)
                break if existe
            end
            if (consulta_codigo(pedido)[2] == "true" && existe)
                @orden << pedido
                @@ordenes_cola << consulta_codigo(pedido)[0]
            else
                puts "No tenemos este producto disponible"
            end
      end

      def mostrar_orden
            @orden.map { |i| consulta_codigo(i)[0]}
      end

      def total_orden
            total = 0
            if (@orden && @orden.size >0)
                @orden.each do |i|
                  total += consulta_codigo(i)[1].to_i # La posicion 1 del array que retorna consulta_codigo es el que tiene el precio (en string)
                end
            end
            total
      end

      def self.ordenes_cola
            puts "Los pedidos en cola son: "
            puts "#{@@ordenes_cola} "
      end
    end
end

# Pagar una orden
# Mostrar el detalle de las ordenes pagadas
# Mostrar el total pagado.

module Caja
    @@total_pagado = 0
    @@detalle_pagos = {}

    def pagar_orden(pago=0)
        total = total_orden
        if pago >= total
            @pago = true
            @@total_pagado += total
            @@detalle_pagos[@cliente] = total
        end
        @pago
    end

    def self.detalle_ordenes
        puts @@detalle_pagos
    end

    def self.total_pagado
        @@total_pagado
    end
end


return
Ordenes.ordenes_cola
puts "En total se ha pagado $#{Caja.total_pagado}"
Caja.detalle_ordenes

return
cliente1.mostrar_menu
puts "El código 008 tiene los siguientes datos: #{a.consulta_codigo("008")}"
