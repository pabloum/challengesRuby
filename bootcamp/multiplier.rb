# En el archivo solution.rb escribe una función llamada multiplier que recibirá dos argumentos, el primero será un arreglo de números y el segundo un número por el cual cada uno de los elementos del primer arreglo se multiplicará.

def multiplier(vec,n)
  # vec.each_with_index do |el,i|
  #   vec[i] = vec[i]*n
  # end
  vec.map! { |i| i * n }  # otra manera
end

vec = [1,2,3,4]
vec = multiplier(vec,3)
puts vec
