# escribir un método llamado count_matches que reciba dos parámetros: un arreglo de números y un número. La función debe devolver el número de veces que aparece el número (segundo parámetro) en el arreglo (primer parámetro).

def count_matches(arr,num)
  veces=0
  arr.length.times do |i|
    if arr[i]==num
      veces+=1
    end
  end
  veces
end

n = count_matches([1,2,3,4,5,5],5)

puts "El número aparece #{n} veces"
