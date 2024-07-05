factorial = lambda {|n| (1..n).inject(:*)}
print "Enter a number to find factorial : "
num = gets.chomp.to_i
puts "The factorial of #{num} is #{factorial.call(num)}"