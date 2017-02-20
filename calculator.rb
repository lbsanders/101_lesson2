# ask the user for two numbers
# ask the user for an operation
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What is the first number?")
number1 = gets().chomp()

Kernel.puts("What is the second number?")
number2 = gets().chomp()

Kernel.puts("What operation would you like to perform? 1) Add  2) Subtract  3) Multiply  4) Divide")
operation = gets().chomp()

if operation == '1'
  result = number1.to_i() + number2.to_i()
elsif operation == '2'
  result = number1.to_i() - number2.to_i()
elsif operation == '3'
  result = number1.to_i() * number2.to_i()
else operation == '4'
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}.")