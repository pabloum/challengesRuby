# -Un atributo de clase que acumule el numero total de pasajeros que se han subido en todos mis buses (todas las instancias)
# - Un metodo de clase que le permita conocer el total de pasajeros que han subido a toda la clase.

##Declare dos clases adicionales que hereden de la clase Bus, llamadas MicroBus y SuperBus

# La clase MicroBus debe poder hacer todo lo q hace el Bus y ademas:
#
# - Al instanciarse recibe el un hash del tipo { nombre_ruta1: "6-9", nombre_ruta2: "9-12" ...}
# - un metodo que reciba la hora y te diga la ruta en la que se encuentra.

# La clase SuperBus debe poder hacer todo lo q hace el Bus y ademas:
#
# - Al instanciarse recibe el precio del ticket de viaje.
# - Un metodo que retorne el dinero total acumulado por la instancia del SuperBus
# - Un atributo y metodo de clase que retorne el total de dinero acumulado por todos las instancias de SuperBus

require 'pry-nav'

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
  attr_reader :pasajeros
  @@pasajeros_acumulados = 0

  def initialize(pasajeros_entran)
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



return ## pruebas

micro = MicroBus.new({ santra316: (6..9), santra315: (9..12)},10)

micro.ruta(10)

# return

superBus1 = SuperBus.new(1500,8)
superBus1.agregar(4)

superBus2 = SuperBus.new(1500,8)
superBus2.agregar(4)

puts SuperBus.ganancias_totales
puts superBus1.ganancia_bus

puts SuperBus.ganancias_totales
puts superBus2.ganancia_bus


# return

bus = Bus.new(12)
puts "la velocidad del bus es #{bus.velocity}" # => 0

bus.agregar(2)
# binding.pry
puts "El bus tiene #{bus.pasajeros} pasajeros"

bus.descargar(8)
puts "El bus tiene #{bus.pasajeros} pasajeros"

bus.agregar(4)
puts "El bus tiene #{bus.pasajeros} pasajeros"

puts "El bus tiene #{Bus.pasajeros_acumulados} pasajeros en todo su historial"

# return

car = Car.new
puts "la velocidad del carro es #{car.velocity}" # => 0

car.accelerate
puts "la velocidad del carro es #{car.velocity}"# => 1

car.accelerate(2)
puts "la velocidad del carro es #{car.velocity}" # => 3

car.brake
puts car.velocity # => 2

car.brake(2)
puts car.velocity # => 0
