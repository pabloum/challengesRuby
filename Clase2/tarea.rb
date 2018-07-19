
contactos = {}

while true
  
  puts "Ingresa el nombre y el número del nuevo contacto. O escribe quit para salir"

  print "Nombre: "
    nombre = gets.chomp
    break if nombre ==  "quit"
    nombre.to_sym
  print "Número: "
    numero = gets.chomp

  contactos[nombre] = numero
end

puts contactos
