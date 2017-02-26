# ask the user for two numbers
# ask the user for an operation
# perform the operation on the two numbers
# output the result
require 'pry'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# MESSAGES['hello'] % {name: "Lori"}
LANGUAGE = 'fr'

def messages(message, lang)
  binding.pry
  MESSAGES[lang][message]
end

def prompt(key)
  binding.pry
  message = messages(key, LANGUAGE)
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

prompt('welcome')


name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do
  number1 = ''
  loop do
    prompt('get_first_number')
    number1 = gets().chomp()
    if number?(number1)
      break
    else
      prompt('invalid_number')
    end
  end

  number2 = ''
  loop do
    prompt('get_second_number')
    number2 = gets().chomp()
    if number?(number2)
      break
    else
      prompt('invalid_number')
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
      prompt('invalid_op')
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

  prompt('another_calc')
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt('thanks  ')
