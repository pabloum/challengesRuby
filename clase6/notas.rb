
## gem install pry
require 'pry' # Sirven comillas simples o dobles

def suma
  binding.pry
  x = 3
  y = 5
  z = x + y
  binding.pry

  z
end

puts suma

# gem list | grep pry  ## muestra tres librerías instaladas

## Métodos de clase
## self.metodo_propio_clase
