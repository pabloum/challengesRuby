require 'pry-nav'

module Conexiones
  class Gps
    def ubicacion
      latitud = rand(-85.0..85.0).round(2)       # "vertical"
      longitud = rand(-180.0..180.0).round(2)    # "horizontal"
      [latitud,longitud]
    end
  end

  class Internet
    def velocidad
      rand(5.0..20.0).round(2)
    end
  end

  class Television
    def initialize(canales_disponibles)
      @canales = canales_disponibles
    end
    def pelicula
      peliculas = ["La naranja Mecánica","Rocky","El Padrino", "El Rey León"]
      peliculas[rand(0...peliculas.length)]
    end
  end

  class Clima
    def pronostico(hora)
      pronostico = {lluvia: [0,1,2,3,4,5,18,19,20] , soleado: [8,9,10,11,12,13,14], nublado: [6,7,15,16,17] , nieve: [21,22,23]}
      estimado = "No se tienen datos suficientes"
      pronostico.each do |k,v|
        estimado = k if v.include?(hora)
      end
      estimado
    end
  end

end

class Car
  attr_reader :velocity
  def initialize
    @velocity = 0
  end
  def accelerate(n=1)
    @velocity += n
  end
  def brake(n=1)
    @velocity -= n
  end
end

class Bus < Car
  include Conexiones
  attr_reader :pasajeros
  @@pasajeros_acumulados = 0

  def initialize(pasajeros_entran=0)
    super()
    @pasajeros = 0
    @pasajeros += pasajeros_entran if pasajeros_entran <= 15
    @@pasajeros_acumulados += @pasajeros
  end
  def agregar(pasajeros_entran)
    if @velocity == 0
       if ((@pasajeros + pasajeros_entran) <= 15)
         @pasajeros += pasajeros_entran
         @@pasajeros_acumulados += pasajeros_entran
       else
         puts "El bus no tiene cupo para tantos. Agregue menos pasajeros, por favor"
       end
    else
       puts "Detenga el bus antes de agregar pasajeros"
    end
  end
  def descargar(pasajeros_entran)
    if @velocity == 0
      if ((@pasajeros - pasajeros_entran) > 0)
        @pasajeros -= pasajeros_entran
      else
        puts "El bus no tiene tantos pasajeros, descargue menos por favor"
      end
    else
      puts "Detenga el bus antes de descargar pasajeros"
    end
  end
  def self.pasajeros_acumulados
    @@pasajeros_acumulados
  end
end


class MicroBus < Bus
  include Conexiones
  def initialize(nombresRutas,pasajeros)
    super(pasajeros)
    @nombres_rutas = nombresRutas
  end

  def ruta (hora)
    key = nil
    @nombres_rutas.each do |k,v|
      key = k if v.include?(hora)
      # binding.pry
    end
    puts "La ruta a la hora #{hora} es #{key}"
  end
end


class SuperBus < Bus
  include Conexiones
  attr_reader :ganancia_bus

  @@ganancias_totales = 0

  def initialize(precio_tiquete,pasajeros)
    super(pasajeros)
    @precio_tiquete = precio_tiquete
    @ganancia_bus = precio_tiquete * pasajeros
    @@ganancias_totales += precio_tiquete * pasajeros
  end

  def agregar(pasajeros)
    super(pasajeros)
    @ganancia_bus += (@precio_tiquete*pasajeros) if @velocity == 0
    @@ganancias_totales += (@precio_tiquete*pasajeros) if @velocity == 0
  end

  def self.ganancias_totales
    @@ganancias_totales
  end

end
=begin
Incluya el modulo Conexiones en la clase Bus y utilice los metodos en instancia de Bus, MicroBus y SuperBus.
Prueben incluyendo Conexiones directamente en MicroBus y SuperBus.
=end

bus_prueba1 = Bus::Internet.new
puts bus_prueba1.velocidad

bus_prueba1 = MicroBus::Internet.new
puts bus_prueba1.velocidad

bus_prueba1 = SuperBus::Internet.new
puts bus_prueba1.velocidad

bus_prueba = Bus.new(4)
puts "El bus tiene #{bus_prueba.pasajeros} pasajeros"
bus_prueba.agregar(5)
puts "El bus tiene #{bus_prueba.pasajeros} pasajeros"
bus_prueba.descargar(3)
puts "El bus tiene #{bus_prueba.pasajeros} pasajeros"
puts "El bus va a #{bus_prueba.velocity} km/h"
bus_prueba.accelerate(5)
puts "El bus va a #{bus_prueba.velocity} km/h"
bus_prueba.brake(1)
puts "El bus va a #{bus_prueba.velocity} km/h"
puts "El bus tiene #{bus_prueba.pasajeros} pasajeros"
puts "Los buses han transportado a #{Bus.pasajeros_acumulados} personas en todo su historial"


micro = MicroBus.new({ santra316: (6..9), santra315: (9..12)},10)
micro.ruta(10)

superBus1 = SuperBus.new(1500,8)
superBus1.agregar(4)
puts "Las ganancias del super bus 1 son: #{superBus1.ganancia_bus}"

puts "Las ganancias de toda la flota son #{SuperBus.ganancias_totales}"

superBus2 = SuperBus.new(1500,6)
superBus2.agregar(7)
puts "Las ganancias del super bus 1 son: #{superBus2.ganancia_bus}"
puts "Las ganancias de toda la flota son #{SuperBus.ganancias_totales}"
