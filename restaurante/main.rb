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
    @@ordenes_cola = []

    def crea_orden(new_order=nil)
      @orden = []
      @orden << new_order
      @@ordenes_cola << consulta_codigo(new_order)[0]
    end

    def agregar_pedido(pedido="007")
      if consulta_codigo(pedido)[2] == "true"
        @orden << pedido
        @@ordenes_cola << consulta_codigo(pedido)[0]
      end
    end

    def total_orden
      total = 0
      @orden.each do |i|
        total += consulta_codigo(i)[1].to_i # La posicion 1 del array que retorna consulta_codigo es el que tiene el precio (en string)
      end
      puts total
    end

    def self.ordenes_cola
      puts "Los pedidos en cola son: "
      puts "#{@@ordenes_cola} "
    end

    # def self.ordenes_cola
    #   puts "Los pedidos en cola son: "
    #   @@ordenes_cola.each do |i|
    #     print "#{consulta_codigo(i)[0]} - " ##{consulta_codigo(i)[0]}
    #   end
    #   puts " "
    # end

end

# Pagar una orden
# Mostrar el detalle de las ordenes pagadas
# Mostrar el total pagado.

module Caja
    def pagar_orden

    end

    def detalle_ordenes

    end

    def total_pagado

    end
end

require_relative "Restaurante.rb"

## prueba del módulo ordenes
cliente1 = Restaurante.new
cliente1.crea_orden("001")
cliente1.agregar_pedido("005")
cliente1.agregar_pedido("009")
cliente1.total_orden

cliente2 = Restaurante.new
cliente2.crea_orden("002")
cliente2.agregar_pedido("003")
cliente2.agregar_pedido("005")
cliente2.total_orden

Ordenes.ordenes_cola

## prueba del módulo menu
return
a = Restaurante.new
a.mostrar_menu
a.agregar_producto
a.mostrar_menu
puts "El código 008 tiene los siguientes datos: #{a.consulta_codigo("008")}"
