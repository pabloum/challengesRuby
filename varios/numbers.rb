
def toEnglish(n)
  units = n%10
  n /= 10
  tens = n%10
  n /= 10
  hundreds = n%10
  n /= 10
  thousands = n%10
  n /= 10
  million = n%10
  n /= 10
  billion = n%10
  n /= 10
  trillion = n%10
  n /= 10

  case tens
    when 1
      print "ten-"
    when 2
      print "twenty-"
    when 3
      print "thirty-"
    when 4
      print "forty-"
    when 5
      print "fifty-"
    when 6
      print "sixty-"
    when 7
      print "seventy-"
    when 8
      print "eighty-"
    when 9
      print "ninty-"
    else
      print " "
  end

  case units
    when 0
      print " "
    when 1
      print "one"
    when 2
      print "two"
    when 3
      print "three"
    when 4
      print "four"
    when 5
      print "five"
    when 6
      print "six "
    when 7
      print "seven"
    when 8
      print "eight"
    when 9
      print "nine "
    when 10
      print "ten "
    when 11
      print "eleven"
    when 12
      print "twelve"
    when 13
      print "thirteen"
    when 14
      print "fourteen"
    when 15
      print "fifteen"
    when 16
      print "sixteen "
    when 17
      print "seventeen"
    when 18
      print "eighteen"
    when 19
      print "ninteem "
    else
      print " "
  end
  print("\n\n")


end

def toRoman(n)

end



print "\nPlease, enter a number that you want to see written: "
n = gets.chomp.to_i
puts " "

print "The number in English may be written as: "
toEnglish(n)
toRoman(n)
