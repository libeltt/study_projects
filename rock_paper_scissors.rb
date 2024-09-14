# The possible choices
choices = [:rock, :scissors, :paper]

# Main game loop (if you want it to repeat)
loop do
  # Prompt the user for input
  print "(R)ock, (S)cissors, (P)aper? "
  s = gets.strip.capitalize  # Get the input and capitalize it

  # Convert user input into a symbol
  user_choice = case s
                when "R"
                  :rock
                when "S"
                  :scissors
                when "P"
                  :paper
                else
                  puts "Invalid input, please choose R, S, or P."
                  next  # If invalid input, repeat the loop
                end

  # Generate the computer's choice
  computer_choice = choices.sample

  # Show the choices
  puts "You chose: #{user_choice.capitalize}"
  puts "Computer chose: #{computer_choice.capitalize}"

  # Determine the winner
  if user_choice == computer_choice
    puts "It's a tie!"
  elsif (user_choice == :rock && computer_choice == :scissors) ||
        (user_choice == :scissors && computer_choice == :paper) ||
        (user_choice == :paper && computer_choice == :rock)
    puts "You win!"
  else
    puts "Computer wins!"
  end

  # Ask if the player wants to play again
  print "Play again? (Y/N): "
  play_again = gets.strip.capitalize
  break unless play_again == "Y"
end

puts "Thanks for playing!"
