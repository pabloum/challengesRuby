# En el archivo solution.rb escribe una función llamada adjust_text que reciba dos argumentos: una cadena de texto (string) y un número (length).

# La función debe ajustar el texto a la longitud que se especifique en el segundo parámetro. Si la longitud de la cadena es mayor que el valor del segundo parámetro, se debe cortar. de lo contrario, se debe completar con espacios.

def adjust_text(cad,n)

  cad = cad + " "*(n-cad.size) if n>=cad.size
  cad = cad[0...n] if n<cad.size

end

z = adjust_text("f ",3)
puts z
puts z.size
