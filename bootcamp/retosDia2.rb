
## Escribe una función llamada create_hash que recibe tres parámetros: temperature, altitude, y pressure. La función debe retornar un hash con tres llaves (temperature, altitude, y pressure) cuyo valor corresponde con el parámetro que tiene el mismo nombre. Las llaves deben ser símbolos no strings.

def create_hash(temperature, altitude, pressure)
  hash = {temperature: temperature, altitude: altitude, pressure: pressure}
end

# El objetivo de este challenge es practicar el acceso y asignación de llaves sobre hashes.
# Instrucciones
#
# Escribe una función llamada defaults que recibe un único parámetro (un hash). La función debe retornar el mismo hash pero con los siguientes cambios:
#
#     Si el hash no tiene la llave :temperature, asignarle el valor de 10.
#     Si el hash no tiene la llave :altitude, asignarle el valor de 12000.
#     Si el hash no tiene la llave :pressure, asignarle el valor de 500.

def defaults(hash)
  hash[:temperature]=10 if hash[:temperature]==nil
  hash[:altitude]=12000 if hash[:altitude]==nil
  hash[:pressure]=500 if hash[:pressure]==nil
  hash

  # {temperature: 10, altitude: 12000, pressure: 500}.merge(hash) # Método alternativo para agregar valores por defecto a un hash
end


## Hola Maker,

# Tu misión en este reto es definir dos funciones, una llamada maximo y otra minimo, que reciben un número variable de argumentos (números) y retornan el máximo y el mínimo respectivamente.


## Pruebo las funciones
puts create_hash(19,1800,85.5)

vble = {hola: 1, bebe:2}
puts defaults(vble)
