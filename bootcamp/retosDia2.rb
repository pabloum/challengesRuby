
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


# Tu misión en este reto es definir dos funciones, una llamada maximo y otra minimo, que reciben un número variable de argumentos (números) y retornan el máximo y el mínimo respectivamente.

def maximo(*arr)
  arr.max
end

def minimo(*arr)
  arr.min
end

# Tu misión en este reto es escribir un método que decida si una cadena de texto (string) es una placa de un vehículo o no.
#
# Las placas de un vehículo se componen de tres letras mayúsculas, seguidas de tres dígitos (p.e. AAA234, o UHJ765).
# Instrucciones
#
# En el archivo solution.rb escribe un método llamado is_plate? que reciba un argumento llamado string, y retorne true si la cadena es una placa de un vehículo, o false de lo contrario.

def is_plate?(placa)
  # placa.scan(/M/).count # Cuenta cuántas letras M hay
  # return false if /[[:lower:]]/.match(placa) != nil

  letras = placa.scan(/[[:upper:]]/).count
  numeros = placa.scan(/\d/).count

  (letras == 3 && numeros == 3) ? (return true) : (return false)

  # string =~ /^[A-Z]{3}[0-9]{3}$/  # manera sugerida
end





#####################################################
#####################################################
#####################################################

## Pruebo las funciones
puts create_hash(19,1800,85.5)

vble = {hola: 1, bebe:2}
puts defaults(vble)

puts maximo(1,2,3,4,3,2,4,22,1,2,346,45,62,334,57,867856,2)
puts minimo(1,2,3,4,19,4,5,64,6,2,3,0.1)

puts is_plate?("MMB965")
