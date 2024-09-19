# Phone book with last name as the key and additional contact info
phone_book = {
  'Smith' => { 
    email: 'john.smith@example.com', 
    cell_phone: '555-123-4567', 
    work_phone: '555-987-6543'
  },
  'Johnson' => { 
    email: 'sara.johnson@example.com', 
    cell_phone: '555-234-5678', 
    work_phone: '555-876-5432'
  },
  'Brown' => { 
    email: 'mike.brown@example.com', 
    cell_phone: '555-345-6789', 
    work_phone: '555-765-4321'
  },
  'Taylor' => { 
    email: 'emma.taylor@example.com', 
    cell_phone: '555-456-7890', 
    work_phone: '555-654-3210'
  },
  'Anderson' => { 
    email: 'david.anderson@example.com', 
    cell_phone: '555-567-8901', 
    work_phone: '555-543-2109'
  },
  'Martinez' => { 
    email: 'luis.martinez@example.com', 
    cell_phone: '555-678-9012', 
    work_phone: '555-432-1098'
  },
  'Garcia' => { 
    email: 'ana.garcia@example.com', 
    cell_phone: '555-789-0123', 
    work_phone: '555-321-0987'
  },
  'Rodriguez' => { 
    email: 'carlos.rodriguez@example.com', 
    cell_phone: '555-890-1234', 
    work_phone: '555-210-9876'
  },
  'Wilson' => { 
    email: 'kate.wilson@example.com', 
    cell_phone: '555-901-2345', 
    work_phone: '555-109-8765'
  },
  'Davis' => { 
    email: 'chris.davis@example.com', 
    cell_phone: '555-012-3456', 
    work_phone: '555-098-7654'
  }
}

# Ask the user for the last name and return the contact information
print 'Enter the last name to search for contact info: '
last_name = gets.chomp.capitalize

if phone_book.key?(last_name)
  contact_info = phone_book[last_name]
  puts "\nContact Information for #{last_name}:"
  puts "Email: #{contact_info[:email]}"
  puts "Cell Phone: #{contact_info[:cell_phone]}"
  puts "Work Phone: #{contact_info[:work_phone]}"
else
  puts "No contact information found for #{last_name}."
end
