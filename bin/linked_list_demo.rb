require_relative "../lib/linked_list"

puts "We first make a new list..."
list = LinkedList.new

puts "And create nodes of the values 1 thru 3..."
first = Node.new(1)
second = Node.new(2)
third = Node.new(3)

puts "And add each node to the list using append!"
list.append(first).append(second).append(third)

puts "\nWe can show the list as a string:"
puts list
puts "\nOr as an array:"
print list.to_a
puts "\n\nAnd we can grab the head:"
puts list.head.value
puts "\nAs well as the tail:"
puts list.tail.value
puts "\nWe can see the size of the list:"
puts list.size
puts "\nAnd we can even flip the list:"
puts list.reverse!


puts "\n\nWe can pop out the last value:"
puts list.pop.value
puts list
puts "\nAnd keep popping..."
puts list.pop.value
puts list
puts "\nUntil the list is empty"
puts list.pop.value
puts list
puts "\nWe can verify the size of the list:"
puts list.size


puts "\n\nWe can also append other data types to the list"
puts "And the list can create the nodes if we havn't already!\n\n"
tail_element = {chips: 1, orange_juice: 2}
puts list.append("hello").append([4, 5, 6]).append(tail_element)

puts "\nUsing the prepend method, we can add items to the front of the list!\n\n"
puts list.prepend(false).prepend(4).prepend(some_variable = "phone")

puts "\n\nWe can get an item at a certain index using the at method"
puts "Our list with it's indexes for comparison:\n\n"
puts list
puts "    0          1          2            3              4                         5"
puts
print "At index 2: "
print list.at(2).value
puts
print "At index 5: "
print list.at(5).value
puts
print "At index 0: "
print list.at(0).value
puts
print "At index -2: "
print list.at(-2).value
puts
print "At index -5: "
print list.at(-5).value
puts
print "At an index outside of list: "
print list.at(8)
puts
print "At a negative index outside of list: "
print list.at(-7)

puts "\n\nElements are still themselves"
puts "For example, we can get our hash at index 5:\n\n"
element_at_index_5 = list.at(5).value
puts element_at_index_5
puts "\nAnd see that it is still a hash:"
print "Value at key orange_juice: "
print element_at_index_5[:orange_juice]


puts "\n\n\nWe can check if an element exists in the list using contains?"
puts "And then we can find it's index"
puts "Our list once again for reference:"
puts
puts list
puts
print "Does the list contain 4? "
print list.contains?(4)
puts
print "At index: "
print list.find(4)
puts "\n\n"
print "Does the list contain phone? "
print list.contains?("phone")
puts
print "At index: "
print list.find("phone")
puts "\n\n"
print "Does the list contain the tail element? "
print list.contains?(tail_element)
puts
print "At index: "
print list.find(tail_element)
puts "\n\n"
print "Does the list contain a non-existent item? "
print list.contains?([45, 20])
puts
print "At index: "
print list.find([45, 20])


puts "\n\n\nWe can insert and remove elements"
puts "At a specified index!"

puts "\nOur list for reference:\n\n"
puts list
p list.size

puts "\nInserting at index 4:"
puts list.insert_at("bananaannas", 4)

puts "\nInserting at index head:"
puts list.insert_at(["leaf", "not leaf"], 0)

puts "\nInserting at tail:"
puts list.insert_at(4444, 8)

puts "\nInserting at negative index right before tail:"
puts list.insert_at("music", -1)

puts "\nInserting at an invalid index:"
puts list.insert_at("floor", 20)

puts "\nDeleting an element at index 4:"
puts list.remove_at(4)

puts "\nDeleting the head:"
puts list.remove_at(0)

puts "\nDeleting the tail:"
puts list.remove_at(-1)

puts "\nDeleting an invalid index"
puts list.remove_at(-10)

puts "\n\nLast but not least!"
puts "We can create a nested linked list!\n\n"

nestedlinkedlist = LinkedList.new
another_list = LinkedList.new.append("another linked list").append("with some elements")
puts nestedlinkedlist.append(list).append(another_list)
