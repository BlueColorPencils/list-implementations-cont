require './linked-list.rb'

# Initializing a Linked List with a node containing value (5)
ll = LinkedList.new

# Adding Elements to Linked List
ll.add(5)
ll.add(10)
ll.add(200)

# Display the Linked List
puts "Displaying Linked List:"
ll.display
puts "Size = #{ll.size}"
puts "Max = #{ll.max}"

puts "Delete 10 and then display the linked list:"
ll.delete(10)
ll.display

puts "Adds 30"
ll.add(30)
puts "Adds 40"
ll.add(40)
ll.display

puts "Size = #{ll.size}"
puts ll.include?(5) ? "Includes? 5 = true" : "Includes? 5 = false"

puts "Delete 5"
ll.delete(5)
ll.display

puts ll.include?(5) ? "Includes? 5 = true" : "Includes? 5 = false"

puts "Delete 40"
ll.delete(40)
puts "Adds 500"
ll.add(500)
puts "Adds -2"
ll.add(-2)
ll.display
puts "Size = #{ll.size}"
puts "Max = #{ll.max}"

puts "Please Sort"
ll.sort
