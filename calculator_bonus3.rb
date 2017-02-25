# ask the user for two numbers
# ask the user for an operation
# perform the operation on the two numbers
# output the result
# require 'pry'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(num)
  num.match(/\d/)
end

def operation_to_message(op)
  text = case op
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
           end
  text
end

prompt("Welcome to Calculator! Please enter your name: ")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?
    prompt("Please enter a valid name.")
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = gets().chomp()
    if number?(number1)
      break
    else
      prompt("Hmm… That doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = gets().chomp()
    if number?(number2)
      break
    else
      prompt("Hmm… That doesn't look like a valid number.")
    end
  end

  operation_prompt = <<~MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operation_prompt)

  operation = ''
  loop do
    operation = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("You must choose 1, 2, 3, or 4.")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers…")

  result = case operation
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}.")

  prompt("Would you like to perform another calculation? (Y to calculate)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")
