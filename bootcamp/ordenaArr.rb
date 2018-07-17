# scribir un método llamado order que reciba dos argumentos, el primero será un arreglo de números y el segundo un booleano que llamaremos reverse el cual puede ser opcional.

# Si el valor de reverse es verdadero la función debe retornar el arreglo de mayor a menor, de lo contrario lo deberá organizar de menor a mayor.


def order(arr,reverse=nil)
  aux = 0
  # puts arr
  if reverse == true  # retorna de mayor a menor
    ((arr.size)).times  do |i|
      for j in (i...(arr.size))
        if (arr[j]) > (arr[i])
          aux = arr[j]
          arr[j] = arr[i]
          arr[i] = aux
        end
      end
    end
  else                # retorna de menor a mayor
    ((arr.size)).times  do |i|
      ((arr.size)).times  do |j|
        if (arr[j]) > (arr[i])
          aux = arr[j]
          arr[j] = arr[i]
          arr[i] = aux
        end
      end
    end
  end

  puts arr

end

order([6,18,9,23,2,1],true)
