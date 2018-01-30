### This is the old sample code that I'll be working with 
# Grab 23 random elements between 0 and 10000 
arr = (1..10000).to_a.sample(23)
p arr

# This selects only elements that when divided by 3 have a 0 remainder.
p arr.select { |element| element % 3 == 0}

# Write a single chain of command to find all numbers that 
#   are from an array of numbers 1..10000 inclusive
#   are divisible by 3 
#   are not less than 5000
#   sorted in reverse order

hw_arr = (1..10000).to_a.select { |element| element % 3 == 0}
                        .reject { |element| element < 5000}
                        .sort.reverse

# puts "Final array looks like: #{hw_arr}"
# puts "Final array length: #{hw_arr.length}"

p hw_arr

