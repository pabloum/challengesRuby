def suma (x,y)
  z = x+y
end


puts "Please, enter two numbers to add"
numero1 = (gets.chomp).to_i
numero2 = (gets.chomp).to_i

z=suma(numero1,numero2)

puts "The result is #{z}"

if z!=5
  puts "I am inside the conditional. The result is not 5"
else
  puts "I am inside the conditional. The result is 5"
end

unless z==5
  puts "The unless worked because the result is not 5"
else
  puts "It is 5"
end

x = (1..20).to_a

x.each do |i|
  puts "#{i}"
end

10.times do |i|
  puts "This is the try number #{i+1}"
end

n=0
loop do
  n+=1
  puts n
  break if n==10
end


x << 21
x.push(22)
x.insert(0,0)
x.delete_at(15)

puts x[20]
puts x[21]
