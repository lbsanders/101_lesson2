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
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_score(player_pts, computer_pts)
  prompt("The score is Player: #{player_pts}  Computer: #{computer_pts}")
end

def game_over?(player_pts, computer_pts)
  player_pts == 5 || computer_pts == 5
end

loop do
  play_win_count = 0
  computer_win_count = 0

  until game_over?(play_win_count, computer_win_count)

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

    result = display_results(choice, computer_choice)
    prompt(result)

    if result == "You won!"
      play_win_count += 1
    elsif result == "Computer won!"
      computer_win_count += 1
    end

    display_score(play_win_count, computer_win_count)

    prompt("")
  end

  prompt("Game is over")
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
