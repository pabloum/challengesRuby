# 1. Un método que permita Importar un archivo del texto el cual contiene en cada linea nombre y teléfono (separado por punto y coma), la información debe ser importada a un hash llamado “directorio”
#
def importar(phones)
  dir = IO.readlines(phones)
  dir.map!{ |e| e.split(";") }
  dir.size.times do |i|
    @directorio[dir[i][0].to_sym] = ((dir[i][1]).split(" "))[0].to_i
  end
end

#
# 2. Un método que permita imprimir todo los nombres y usuarios del directorio.
#
def mostrarDirectorio
  puts File.read("directorio.txt")
end
#
#
# 3. Que tenga un método que permita agregar un usuario con su respectivo telefono al hash “directorio” y también al archivo de texto.
#
def agregar
  print "Ingrese el nombre: "
  name = gets.chomp.to_sym
  print "Ingrese el número: "
  number = gets.chomp.to_i
  File.open("directorio.txt", 'a') { |file| file.puts("#{name}; #{number}") }
  @directorio[name] = number
end
#
# 4. Que tenga un metodo que reciba el nombre del usuario y retorne su teléfono.
#
def getNumber(name)
  numero = 0
  if @directorio.has_key?(name)
    numero = @directorio[name]
    puts "El número de #{name} es #{numero}"
  else
    puts "El contacto #{name} aún no existe "
  end
  numero
end
#
# 5. Al ejecutarse el programa se carga automáticamente el archivo de texto, debe preguntarle que quiere hacer:  Agregar un teléfono, Buscar un teléfono,  imprimir el directorio completo ó salir.
#

@directorio = {}
importar("directorio.txt")
mostrarDirectorio

while true
  system("clear")
  puts "Bienvenido al directorio."
  puts "\n\t1. Agregar contactos al directorio"
  puts "\t2. Buscar un teléfono en el directorio"
  puts "\t3. Ver el directorio completo"
  puts "\t4. Salir del programa."
  print "\nIngrese la opción que desea: "
  op = gets.chomp.to_i

  case op
    when 1
      puts " "
      agregar
    when 2
      puts " "
      print "Ingrese el nombre que desea buscar: "
      name = gets.chomp.to_sym
      getNumber(name)
    when 3
      puts " "
      mostrarDirectorio
    when 4
      break
    else
      puts "\n#{op} no es una opción válida."
  end
  print "\nPresione una Enter para continuar";gets
end
