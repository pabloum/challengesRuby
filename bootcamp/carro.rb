class Car

  # attr_accessor :velocity # Para evitar escribir siempre getters y setters
  attr_reader :velocity # Sólo deja leer, i.e. getter.
  # attr_writer :velocity # Sólo deja escribir, i.e. setter

  def initialize
    @velocity = 0
  end

  def accelerate(n=nil)
    n == nil ?  @velocity += 1 : @velocity += n
  end

  def brake(n=nil)
    n == nil ?  @velocity -= 1 : @velocity -= n
  end


end

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
