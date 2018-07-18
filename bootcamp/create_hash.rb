
## Escribe una función llamada create_hash que recibe tres parámetros: temperature, altitude, y pressure. La función debe retornar un hash con tres llaves (temperature, altitude, y pressure) cuyo valor corresponde con el parámetro que tiene el mismo nombre. Las llaves deben ser símbolos no strings.

def hash(temperature, altitude, pressure)
  hash = {temperature: temperature, altitude: altitude, pressure: pressure}
end

puts hash(19,1800,85.5)
