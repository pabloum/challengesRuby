# 1. hacer un llamada (no se puede hacer una llamada si el teléfono esta ocupado)
#
# 2. mostrar llamada actual (nombre y numero)
#
# 3. colgar
#
# 4. mostrar historial de llamadas, cada llamada almacena la duración de la misma.
#
# 5. Complementarlo con el código del directorio. Sölo puedo llamar a la gente que tenga en mi directorio

class Telefono

  @@historia = {}
  @@llamada = 0

  def initialize
    @state = false
  end

  def llamar(nombre,numero)
    confirmacion = directorio(nombre,numero)
    if confirmacion == true
      @state = true
      @@llamada += 1
      @@historia[@@llamada] = [nombre,numero]
      @@start = Time.now
    else
      puts "Este número no está en el directorio"
      print "\n" ## Para leer más fácil en la terminal
    end
  end

  def mostrarLlamadaActual
    if @state == true
      puts "La llamada es a #{@@historia[@@llamada]}"
    else
      puts "No hay llamada en curso"
    end
    print "\n" ## Para que sea más cómodo de leer en la terminal

  end

  def colgar
    if @state == true ## Hago sto si la llamada está activa
      @@finish = Time.now ## Guardo el tiempo de finalización de llamada
      @@historia[@@llamada] << (@@finish - @@start) ## Guardo en mi hash el tiempo de llamada si la llamada sí se ejecutó
      @state = false  ## Termino mi llamada
    end
  end

  def historiaLlamadas
    puts "El orden es el siguiente: [nombre, número, tiempo llamada]"
    print "\n" ## Para que sea más cómodo de leer en la terminal
    @@historia.each do |k,i|
      print "Llamada #{k}: " ## Imprimo la llamada
      print i   ## Imprimo el array con la info: Nombre, teléfono y tiempo
      print "\n" ## Para que sea más cómodo de leer en la terminal
    end
    # puts @@historia
  end

  private
  def directorio(nombre,numero)
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
