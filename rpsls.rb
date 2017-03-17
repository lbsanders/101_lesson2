VALID_CHOICES = { r: 'rock',
                  p: 'paper',
                  s: 'scissors',
                  l: 'lizard',
                  v: 'Spock' }

WINNING_COMBINATIONS = [%w(r s), %w(r l),
                        %w(p v), %w(p r),
                        %w(s l), %w(s p),
                        %w(l p), %w(l v),
                        %w(v r), %w(v s)]

def win?(first, second)
  WINNING_COMBINATIONS.include?([first.to_s, second.to_s])
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one: rock, paper, scissors, lizard, Spock")
    VALID_CHOICES.each { |key, value| puts "     #{key} for #{value}" }
    choice = Kernel.gets().chomp().downcase.to_sym

    if VALID_CHOICES.key?(choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample()

  prompt("You chose #{VALID_CHOICES[choice]}")
  prompt("Computer chose #{VALID_CHOICES[computer_choice]}")
  prompt("")

  display_results(choice, computer_choice)

  prompt("")
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
