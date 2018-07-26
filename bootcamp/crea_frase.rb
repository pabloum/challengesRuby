require "pry-nav"

def phrase(arr)
  if arr.size > 1
    frase = arr[0...(arr.size - 1)].join(", ") << " y " << arr[-1]
  elsif arr.size == 1
    frase = arr[0].to_s
  else
    frase = ""
  end
  frase
end

def secret_code(texto)
  # Lo resolvieron con un  hash
  n1 = n2 = n3 = n4 = n5 = n6 = n7 = n8 = n9 = 0
  # binding.pry
  texto = texto.split(" ")
  n1 = 1*texto.count("one") if texto.include?("one")
  n2 = 2*texto.count("two") if texto.include?("two")
  n3 = 3*texto.count("three") if texto.include?("three")
  n4 = 4*texto.count("four") if texto.include?("four")
  n5 = 5*texto.count("five") if texto.include?("five")
  n6 = 6*texto.count("six") if texto.include?("six")
  n7 = 7*texto.count("seven") if texto.include?("seven")
  n8 = 8*texto.count("eigth") if texto.include?("eight")
  n9 = 9*texto.count("nine") if texto.include?("nine")
  # puts texto

  res = n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9

end

# class String
#   def self.palindrome?
#     aux = self.gsub(" ","")
#     aux == aux.reverse
#   end
# end
#
# puts "anita lava la tina".palindrome?

# Prueba del método secret_code
# puts secret_code("one two three one moneky one")


# binding.pry
## Prueba del método phrase
# x = ["uno","dos", "tres"]
# puts phrase(x)
