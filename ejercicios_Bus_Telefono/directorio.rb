require "pry-nav"

# Incluir el modulo Gagets en la clase CellPhone y usar todas las clases y metodos desde instancias de CellPhone.

module Gadgets

  class Calculadora
    def suma(x,y)
      x + y
    end
    def resta(x,y)
      x - y
    end
  end

  class Termometro

    def consulta_temperatura (hora = Time.now.hour)
      @temp = rand(-10..10) if (0..6).include?(hora)
      @temp = rand(10..25) if (7..11).include?(hora)
      @temp = rand(25..32) if (12..15).include?(hora)
      @temp = rand(18..22) if (16..18).include?(hora)
      @temp = rand(10..18) if (19..23).include?(hora)
      @temp
    end

    def mostrar_temperatura
      consulta_temperatura
      puts "La temperatura es #{@temp}°C"
    end
  end

  class BlockDeNotas

    def agregar_nota(mensaje)
      File.open("bloc_notas.txt", 'w') { |file| file.puts("#{mensaje}\n") }
    end

    def consultar_nota
      @nota = IO.readlines("bloc_notas.txt")
      puts @nota
    end

    def borrar_nota(linea_para_borrar)
      @nota[linea_para_borrar-1] = " "
      File.open("bloc_notas.txt", 'w') { |file| file.puts("#{@nota.join(" ")}\n") }
    end
  end
end

class Telefono

  @@dispositivos_creados = 0
  @@tiempo_total_llamadas = 0

  def initialize
    @state = false
    @llamadas_hechas = 0
    @historia = {}
    @@dispositivos_creados += 1
  end

  def self.dispositivos_creados
    @@dispositivos_creados
  end

  def self.tiempo_total_llamadas
    @@tiempo_total_llamadas
  end

  def llamar(nombre,numero)
    confirmacion = directorio(nombre)
    if confirmacion == true
      @state = true
      @llamadas_hechas += 1
      @historia[@llamadas_hechas] = {nombre: nombre,numero: numero}
      @start = Time.now
    else
      puts "El contacto #{nombre} no está en el directorio"
      print "\n" ## Para leer más fácil en la terminal
    end
    @state
  end

  def mostrarLlamadaActual
    if @state == true
      puts "La llamada es a #{@historia[@llamadas_hechas]}"
    else
      puts "No hay llamada en curso"
    end
    print "\n"
  end

  def colgar
    if @state == true
      @finish = Time.now
      tiempo_llamda = (@finish - @start).round(3)
      @@tiempo_total_llamadas += tiempo_llamda
      @historia[@llamadas_hechas][:duracion] = tiempo_llamda
      @state = false  ## Termino mi llamada
    end
  end

  def historiaLlamadas
    @historia.each do |k,v|
      print "Llamada #{k}: "
      print v
      print "\n"
    end
    # puts @@historia
  end

  private
  def directorio(nombre)
    directorio = {}
    dir = IO.readlines("directorio.txt")
    dir.map!{ |e| e.split(";") }
    dir.size.times do |i|
      directorio[dir[i][0].to_sym] = ((dir[i][1]).split(" "))[0].to_i
    end
    if directorio.key?(nombre.to_sym)
      return true
    else
      return false
    end
  end

end

class Fax < Telefono
  def initialize(horario)
    super()
    @horario = horario
  end
  def llamar(nombre,numero)
    # binding.pry
    unless @horario[:available].include?(Time.now.hour)
      return @horario[:custom_message]
    else
      super(nombre,numero)
      return "Se realizó la llamada\n "
    end
  end
  def documento(archivo)
    mensaje = File.read(archivo)
    File.write("documento.txt", mensaje)
  end
end

# Al instanciarse debe recibir el numero de horas que durara la bateria.
# un metodo privado que reduzca la bateria a una tasa de 1% x segundo.
# Debe tener un metodo charge ó carga que retorne la carga actual del celular.

class CellPhone < Telefono
  include Gadgets
  def initialize (horas_bateria)
    super()
    @horas_bateria = horas_bateria
    @inicio_celular = Time.now
    @bateria = 100
  end

  def carga
    horas_uso = (Time.now - @inicio_celular) * 1/3600
    @bateria = (@horas_bateria - horas_uso) * 100/@horas_bateria
  end

  private
  def reducir_bateria
    carga
    loop do
      @bateria -= 1
      break if @bateria == 0
      sleep(1)
    end
    t
  end
end

#########################################
#########################################
###### PRUEBAS DE LOS MÉTDOS Y CLASES ###
#########################################
#########################################
cell_test = CellPhone::Termometro.new
cell_test.consulta_temperatura(3)
cell_test.mostrar_temperatura


return
cell_test = CellPhone.new(3)
sleep(3)
cell_test = CellPhone::BlockDeNotas.new
cell_test.agregar_nota("Hello world\nHallo Welt\nSalut monde")
cell_test.consultar_nota
cell_test.borrar_nota(2)
cell_test.consultar_nota

fax_test = Fax.new({ available: (8..17),
  custom_message: "Gracias por llamar. En este momento nuestras oficinas están cerradas"})
puts fax_test.llamar("Andres",13265)
fax_test.documento("directorio.txt")

t1 = Telefono.new

t1.llamar("Pablo Uribe","2381513")
sleep(0.4)
t1.mostrarLlamadaActual
t1.colgar
t1.mostrarLlamadaActual

t1.llamar("Camilo","1665321")
sleep(0.4)
t1.colgar

t1.llamar("Sebastian","3232620")
sleep(0.4)
t1.colgar

t1.llamar("Isaías","65849")
sleep(0.4)
t1.colgar

t1.historiaLlamadas
p Telefono.dispositivos_creados
p Telefono.tiempo_total_llamadas
