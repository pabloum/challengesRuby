# reto es diseñar y escribir un método llamado fizz_buzz que reciba como único argumento un número. El método debe cumplir las siguientes condiciones:

# Si el número de entrada es múltiplo de 3 debe retornar el string fizz
#
# Si el número de entrada es múltiplo de 5 debe retornar el string buzz
#
# Si el número de entrada es múltiplo tanto de 3 como de 5 debe retornar el string fizzbuzz
#
# Si el número no cumple ninguna de estas condiciones debe retornar el mismo numero de entra

def fizz_buzz(n)
  if n%3 == 0 && n%5 == 0
    return "fizzbuzz"
  elsif n%3 == 0
    return "fizz"
  elsif n%5 == 0
    return "buzz"
  else
    return n
  end   
end
