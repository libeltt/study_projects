# Cart
cart = [
  { type: :soccer_ball, qty: 2 },
  { type: :tennis_ball, qty: 3 }
]

# Inventory
inventory = {
  soccer_ball: { available: 2, price_per_item: 100 },
  tennis_ball: { available: 1, price_per_item: 30 },
  golf_ball: { available: 5, price_per_item: 5 }
}

# Initialize total price
total_price = 0

# Loop through each item in the cart
cart.each do |item|
  product = item[:type]  # Get product type (e.g., :soccer_ball)
  qty_in_cart = item[:qty]  # Get quantity from cart
  
  # Check if the product exists in inventory
  if inventory[product]
    # Get available quantity and price per item from inventory
    available_qty = inventory[product][:available]
    price_per_item = inventory[product][:price_per_item]
    
    # If there are some items in stock, sell as many as available
    if available_qty > 0
      # Determine how many can be sold
      qty_sold = [available_qty, qty_in_cart].min  # Take the smaller of available and requested
      
      # Calculate total price for the items sold
      total_price += qty_sold * price_per_item
      
      puts "#{qty_sold} #{product.to_s.gsub('_', ' ')}(s) sold."
      
      # Inform if the requested quantity couldn't be fulfilled
      if qty_in_cart > available_qty
        puts "Only #{available_qty} #{product.to_s.gsub('_', ' ')}(s) available. The rest couldn't be fulfilled."
      end
    else
      # Not enough stock available
      puts "No #{product.to_s.gsub('_', ' ')}s available."
    end
  else
    # Product not found in inventory
    puts "#{product.to_s.gsub('_', ' ')} is not available in inventory."
  end
end

# Print the total price for all items in the cart
puts "Total price for your cart: $#{total_price}"
