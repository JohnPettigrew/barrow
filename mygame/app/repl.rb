# ===============================================================
# Welcome to repl.rb
# ===============================================================
# You can experiement with code within this file. Code in this
# file is only executed when you save (and only excecuted ONCE).
# ===============================================================

xrepl do
  message = "Hello World"
  puts "The value of message is: " + message
  puts "Any value can be interpolated within a string using \#{}."
  puts "Interpolated message: #{message}."
  puts 'This #{message} is not interpolated because the string uses single quotes.'
end

xrepl do
  puts "======== All combination of numbers 1 to 10."
  one_to_ten = (1..10).to_a
  all_combinations = one_to_ten.product(one_to_ten)
  puts all_combinations
end
