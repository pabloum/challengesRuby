class Person < StandardError
  attr_accessor :name
  def name=(name)
    if name == nil or name.size == 0
      raise ArgumentError.new('ArgumentError')
    end
    name = name.dup
    name[0] = name[0].chr.capitalize
    @name = name
  end
  def initialize(name)
    if name == nil or name.size == 0
      raise ArgumentError.new('ArgumentError')
    end
    @name = name
  end
end

pablo = Person.new("Pablo")
nulo = Person.new("nil")

puts pablo.name
puts nulo.name
