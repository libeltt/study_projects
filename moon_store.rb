# Initial hash with weights in grams on Earth
obj = {
  soccer_ball: 410, # weight in grams
  tennis_ball: 58,
  golf_ball: 45
}

# Transform the hash to moon conditions (6 times less weight)
moon_weights = obj.transform_values do |earth_weight|
  (earth_weight / 6.0).round(2) # Dividing by 6 and rounding to 2 decimal places
end

# Ask the user how many of each ball they want to buy
quantities = {}

obj.each do |ball, weight|
  print "How many #{ball.to_s.gsub('_', ' ')}s would you like to buy? "
  quantities[ball] = gets.to_i
end

# Calculate total weights for both Earth and Moon
total_weight_earth = 0
total_weight_moon = 0

obj.each do |ball, weight|
  quantity = quantities[ball]
  total_weight_earth += weight * quantity
  total_weight_moon += moon_weights[ball] * quantity
end

# Output the total weights
puts "\nTotal weight of items in the cart:"
puts "On Earth: #{total_weight_earth} grams"
puts "On the Moon: #{total_weight_moon.round(2)} grams"