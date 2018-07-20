
### Ejercicio: pedirlle al usuario una cadena y devolverla en mayúscula y en reversa.

# puts "Ingrese una cadena de texto"
# str = gets.chomp
#
# puts str.upcase.reverse
#
# inv = str.reverse
#
# (str == inv) ? (puts "Es palíndorme") : (puts "No es palíndrome")


#### el de las libretas de direcciones


# def agrega (nombre,numero)
#   @contactos[nombre] = numero
# end
#
# @contactos = {}
# while true
#
#   puts "Ingresa el nombre y el número del nuevo contacto. O escribe quit para salir"
#
#   print "Nombre: "
#     nombre = gets.chomp
#     break if nombre ==  "quit"
#     nombre.to_sym
#   print "Número: "
#   numero = gets.chomp.to_i
#   agrega(nombre,numero)
# end
#
# puts @contactos

# librería pry --> debug

mensaje = File.read("texto1.txt")

mensaje = mensaje.split("\n")
mensaje.map! { |i| i = i + rand(1..100).to_s}
mensaje = mensaje.join("\n")

File.write("texto4.txt", mensaje)

#####################################

numeros = IO.readlines("texto2.txt")

numeros.map!{ |i| i.split("\n") }
puts numeros

mayores = []

numeros.each do |i|
  if i[0].to_i > 10
    mayores << i
  end
end

mayores = mayores.join("\n")

File.write("numeros.txt", mayores)
