
### Ejercicio: pedirlle al usuario una cadena y devolverla en mayúscula y en reversa.

puts "Ingrese una cadena de texto"
str = gets.chomp

puts str.upcase.reverse

inv = str.reverse

(str == inv) ? (puts "Es palíndorme") : (puts "No es palíndrome")
