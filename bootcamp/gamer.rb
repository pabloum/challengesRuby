# crear un metodo llamado alive? que reciba dos argumentos llamados playerName y points

# alive? debe retornar verdadero si playerName es igual a "ikk" y points es mayor a 30, o si playerName es igual a "gut" y points es mayor a 10. De lo contrario, debe retornar falso.

def alive?(playerName,points)

  if playerName == "ikk" && points >30
    return true
  elsif playerName == "gut" && points >10
    return true
  else
    return false
  end

  # (player_name == "ikk" && points > 30) || (player_name == "gut" && points > 10)

end
