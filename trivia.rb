require 'httparty'
require 'json'
require 'cgi'

# Fetch the trivia data
url = 'https://opentdb.com/api.php?amount=10'
resp = HTTParty.get(url)
trivia = JSON.parse(resp.body)

# Check if response code is 0, else exit with an error
if trivia["response_code"] != 0
  puts "Error fetching trivia questions."
  exit
end

correct_answers = 0

# Loop through each question and prompt the user for their answer
trivia["results"].each_with_index do |question, index|
  puts "\nQuestion #{index + 1}:"
  puts CGI.unescapeHTML(question["question"])  # Decoding HTML entities in the question

  # Combine correct and incorrect answers, then shuffle them
  answers = question["incorrect_answers"] + [question["correct_answer"]]
  answers.shuffle!

  # Display the shuffled answers
  answers.each_with_index do |answer, i|
    puts "#{i + 1}. #{CGI.unescapeHTML(answer)}"  # Decoding HTML entities in the answers
  end

  # Ask user for their answer
  print "Your answer (1-#{answers.size}): "
  user_answer = gets.to_i

  # Check if the selected answer matches the correct answer
  if answers[user_answer - 1] == question["correct_answer"]
    puts "Correct!"
    correct_answers += 1
  else
    puts "Wrong! The correct answer was: #{CGI.unescapeHTML(question["correct_answer"])}"
  end
end

# Display final score at the end
puts "\nYou got #{correct_answers} out of 10 questions right!"