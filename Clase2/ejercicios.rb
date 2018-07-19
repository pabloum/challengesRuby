
# 1. Escriba un programa que reciba el numero de elementos que debe contener un array, y retorne el dicho array, los elementos q contiene el array deben ser numeros aleatorios  del 1 al 100.

# 2. Haga q el anterior programa calcule y retorne la suma de los números y su promedio.

# 3. Haga el anterior programa retorne la cantidad de pares e impares.

## Ejercicio 1


def randArr(n)

  arr=[]
  n.times do |i|
    arr << rand(1..100)
  end

  suma = 0
  arr.each do |i|
    suma += i
  end

  # Otra manera según StackOverflow
  # sum = 0
  # arr.inject(0){|sum,x| sum + x }
  # sum = 0
  # arr.inject{ |sum, el| sum + el }.to_f / arr.size

  par = 0; impar = 0;
  arr.each do |i|
    par += 1 if i%2 == 0
    impar += 1 unless i%2 == 0
  end

  {arreglo: arr, suma: suma, promedio: suma/n, pares: par, impares: impar}
end

puts randArr(5)
