def fib(n)
  x=0
  aux=x

  print "The Fibonacci series is: 0 " if n == 1
  print "The Fibonacci series is: 0 1 " if n == 2
  x = 0
  y = 1
  
  if n > 2
    print "The Fibonacci series is: 0 1 "
    (n-2).times do
      z = x + y
      x = y
      y = z
      print "#{z} "
    end
    puts "\n"
  end
  print "\n"
end

print "Hello, Mr. Please, insert the number of indexes of the Fibonacci series that you want to see: "

n = gets.chomp.to_i

print "\n"

fib(n)
