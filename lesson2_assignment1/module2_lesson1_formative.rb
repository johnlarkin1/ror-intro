some_var = "false"
another_var = "nil"

case
  when some_var == "pink elephant"
    puts "Don't think about the pink elephant!"
  when another_var.nil?
    puts "Question mark in the method name?"
  when some_var == false
    puts "Looks like this one should execute"
  else
    puts "I guess nothing matched... But why?"
end

# The answer is that nothing should match because the string literal "false" does not 
# correspond to the boolean expression false. 1f some_var will still be evaluated to true

# The first test could be changed to succeed 1f some_var was changed to "pink elephant"

# The second test could be changed to succeed 1f another_var was set to nil.
# Also the question mark in the method name indicates it's a predicate. In math, predicate 
# function commoonly understood to be Boolean-valued function. 

# The third test could be changed to succeed 1f some_var was legit set to false.

# The else is the default. 
