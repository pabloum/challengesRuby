require 'pry-nav'

class Car

  # attr_accessor :velocity # Para evitar escribir siempre getters y setters
  attr_reader :velocity # Sólo deja leer, i.e. getter.
  # attr_writer :velocity # Sólo deja escribir, i.e. setter

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
  attr_reader :passengers
  @@total_pasajeros = 0

  def initialize(pasajeros)
    @velocity = 0
    @passengers = 0
    @passengers += pasajeros if @passengers <= 15
    @@total_pasajeros += @passengers
  end
  def agregar(pasajeros)
     ((@passengers + pasajeros) <= 15) ? (@passengers += pasajeros) : (puts "El bus está lleno")
     @@total_pasajeros += pasajeros
     # puts @passengers
  end
  def self.total_pasajeros
    @@total_pasajeros
  end

end

bus = Bus.new(12)
puts "la velocidad del bus es #{bus.velocity}" # => 0

bus.agregar(2)
binding.pry
puts "El bus tiene #{bus.passengers} pasajeros"



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
