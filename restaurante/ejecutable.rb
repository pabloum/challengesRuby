require "pry-nav"
require_relative "Restaurante.rb"

interfaz = File.read("interfazPrograma.txt")


cliente = Restaurante.new


while true
  puts interfaz
  op = gets.chomp.to_i

  case op
    when 1  # 1 - Ver el Menú
      cliente.mostrar_menu
      puts "Presione enter para continuar"
      gets
    when 2  # 2 - Hacer una orden
      puts "Ingrese el código del producto que desea"
      producto = gets.chomp
      cliente.crea_orden(producto)
      puts "Acabó de ordenar #{cliente.consulta_codigo(producto)[0]}"
      puts "\nPresione enter para continuar"
      gets
    when 3  # 3 - Ver orden actual
      puts "Ha ordenado los siguientes productos: #{cliente.mostrar_orden.join(" - ")}"
      puts "\nPresione enter para continuar"
      gets
    when 4   # 4 - Agregar productos a su orden
      puts "Ingrese el código del producto que desea"
      producto = gets.chomp
      cliente.agregar_pedido(producto)
      puts "Acabó de ordenar #{cliente.consulta_codigo(producto)[0]}"
      puts "\nPresione enter para continuar"
      gets
    when 5  # 5 - Consultar el total del pedido
      puts "El total de la cuenta es #{cliente.total_orden}"
      puts "\nPresione enter para continuar"
      gets
    when 6  # 5 - Pagar
      puts "Ingrese la cantidad de dinero que va a entragar"
      dinero = gets.chomp.to_i
      total = cliente.total_orden
      pago = cliente.pagar_orden(dinero) if dinero>=total
      if dinero > total
        puts "Su devuleta es de #{dinero - cliente.total_orden}"
      elsif dinero < total
        puts "Este dinero no es suficiente"
      end
      puts "Gracias por su pago, vuelva pronto " if pago == true
      break if pago == true
    when 7  # 6 - Ingresar nuevo cliente
      next
    else
      puts "La opción no es válida"
  end
end
