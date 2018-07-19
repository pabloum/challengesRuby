
# Tu misión en este reto es crear dos métodos: load_tasks y save_tasks.
#
# load_tasks recibe el nombre de un archivo y debe retornar un arreglo de hashes con la información que se encuentra en el archivo. El formato del archivo es:
#
# 1,Hacer tareas,true
# 2,Lavar ropa,false
#
# El método debería retornar:
#
# [
#   { id: 1, name: "Hacer tareas", done: true },
#   { id: 2, name: "Lavar ropa", done: false }
# ]
#
# Nota: Si el archivo no existe o es vacío debe retornar un arreglo vacío.
 def load_tasks(name)

   tasks = []

   return tasks unless File.file?(name)
   arr = IO.readlines(name)

   arr.each_with_index do |el,i|
     el = el.split(',')
     tasks[i] = {id: el[0].to_i, name: el[1], done: el[2]=="true\n" }
   end

   tasks
 end

puts load_tasks("texto.txt")

# save_tasks recibe dos parámetros: el nombre del archivo y un arreglo de hashes con las tareas que debe escribir en el archivo. Por ejemplo:
#
# save_tasks('tasks.txt', [
#   { id: 1, name: "Hacer tareas", done: true },
#   { id: 2, name: "Lavar ropa", done: false }
# ])
#
# Este llamado debería crear (o sobrescribir) el archivo tasks.txt con el siguiente contenido:
#
# 1,Hacer tareas,true
# 2,Lavar ropa,false

def save_tasks(name,tareas)

  content = ""

  tareas.each_with_index do |el,i|
    content += (tareas[i][:id]).to_s + "," + tareas[i][:name] + "," + tareas[i][:done].to_s + "\n"
  end

  File.open(name, 'w') { |file| file.write(content) }

end


puts File.read('tasks.txt')
