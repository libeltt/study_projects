require 'set'

def f(str)
  set = Set.new
  # Scan only alphabetic characters and convert to lowercase
  str.scan(/[a-zA-Z]/).each do |c|
    set.add(c.downcase)
    # Break early if all 26 letters have been found
    return true if set.size == 26
  end
  false
end

# Example: Pass a large text (or even a whole book) to test the method
puts f('Quick Brown Fox Jumps Over The Lazy Dog and many other words...')  # true

puts f('Brown Fox Jumps Over The Lazy Dog and many other words...')  # true
