def launch(params = {})
  # Set default values
  angle = params[:angle] || 90
  astronauts = params[:astronauts] || [:belka, :strelka]
  delay = params[:delay] || 5

  # Countdown before the launch
  delay.downto(1) do |i|
    puts "Time to start: #{i}"
    sleep 1  # Delay 1 second between each number
  end

  # Launch the spaceship and print the astronauts and angle
  puts "Launching spaceship at angle #{angle} degrees!"
  puts "Astronauts: #{astronauts.map(&:capitalize).join(' and ')} have been sent to space!"
end

# Example calls:

launch
launch(angle: 91)
launch(delay: 3)
launch(delay: 3, angle: 91)
launch(astronauts: [:belka]) # and so on