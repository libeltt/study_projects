client = {
  name: 'Mark Zuck',
  transactions: [
    { description: 'McDonalds', type: 'withdrawal', amount: 40 },
    { description: 'Selling ads', type: 'deposit', amount: 1000 },
    { description: 'Selling user data', type: 'deposit', amount: 300 },
    { description: 'Lawyer', type: 'withdrawal', amount: 200 },
    { description: 'Lunch with friends', type: 'withdrawal', amount: 300 }
  ],
  show_deposits: true,
  show_balance: true
}

# Step 1: Show account holder's name
puts "Welcome, #{client[:name]}!"

# Step 2: Ask if user wants to toggle showing deposits on or off
puts "Do you want to see deposits? (yes/no)"
client[:show_deposits] = gets.chomp.downcase == 'yes'

# Step 3: Display all transactions, filtering deposits if needed
puts "\nHere are your transactions:"

client[:transactions].each do |transaction|
  # Always show withdrawals, only show deposits if the user opts in
  if client[:show_deposits] || transaction[:type] == 'withdrawal'
    puts "#{transaction[:description]}: #{transaction[:type].capitalize} of $#{transaction[:amount]}"
  end
end

# Step 4: Calculate the balance
balance = 0
client[:transactions].each do |transaction|
  if transaction[:type] == 'deposit'
    balance += transaction[:amount] # Add deposits
  else
    balance -= transaction[:amount] # Subtract withdrawals
  end
end

# Step 5: Print balance at the end
puts "\nYour current balance is: $#{balance}"
