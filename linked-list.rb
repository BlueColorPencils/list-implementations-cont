# Quick Example of a Self Referential Data Structure in Ruby
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node
   attr_accessor :value, :next_node

   def initialize(val,next_in_line=nil)
     @value = val
     @next_node = next_in_line
     #puts "Initialized a Node with value:  " + value.to_s
   end
end

class LinkedList
   def initialize
     @head = nil
     @size = 0
   end

   def add(value)
       if @size == 0
         @head = Node.new(value,nil)
         @size += 1
       else
       # Traverse to the end of the list
       # And insert a new node over there with the specified value
       current = @head
       while current.next_node != nil
           current = current.next_node
       end
       current.next_node = Node.new(value,nil)
       @size += 1
     end
       self
   end

   def delete(val)
     return nil if @size == 0
     if @head.value == val
         # If the head is the element to be delete, the head needs to be updated
         @head = @head.next_node
         @size -= 1
     else
         # ... x -> y -> z
         # ... x -> y -> z
         # Suppose y is the value to be deleted, you need to reshape the above list to :
         #   ... x->z
         previous = @head
         current = @head.next_node
         while current != nil && current.value != val
             previous = current
             current = current.next_node
         end

         if current != nil
             previous.next_node = current.next_node
             @size -= 1
         end
     end
   end

   def display
       # Traverse through the list till you hit the "nil" at the end
       current = @head
       full_list = []
       while current.next_node != nil
           full_list += [current.value.to_s]
           current = current.next_node
       end
       full_list += [current.value.to_s]
       puts "===" + full_list.join("->") + "==="
   end

   def include?(key)
     current = @head
     while current != nil
       return true if current.value == key
       current = current.next_node
     end
     return false
   end

   def size
     return @size
   end

  def sort
    count = 0
    previous = @head
    current = @head.next_node
    nxt = current.next_node
    size % 2 == 0? counter = (size/2) : counter = (size/2)+1

    while count < counter
      # // edge case at the end.. if at the end of the list
      if (current.next_node == nil)
        count = 0
        previous = @head
        current = @head.next_node
        nxt = current.next_node
      end

      # // edge case at the front .. if at the head & the current value is less than the head
      if (previous == @head) && (current.value < previous.value)
      # reassign the pointers
      current.next_node, previous.next_node = previous, current.next_node
      #  reassign the node pointers
      current, previous, @head = previous, current, current
      end

      # if current is greater than next value
      if (nxt.value < current.value)
        # if at the end
        if nxt.next_node != nil
          current.next_node, previous.next_node, nxt.next_node = nxt.next_node, nxt, current
          previous, nxt = nxt, current.next_node
        else
          previous.next_node, nxt.next_node, current.next_node = nxt, current, nil
        end

      # if current is less than next value
      elsif (nxt.value > current.value)
        count += 1
        # if at the end
        if (nxt.next_node != nil)
          previous, current, nxt = current, nxt, nxt.next_node
        else
          current, current.next_node = current.next_node, nil
        end
      end
    end
    # return display
  end




  def reverse
    previous = @head
    current = previous.next_node
    previous.next_node = nil #set the beginning to be the end

    until (current.next_node == nil)
      # change the pointer to the one before it
      # move node pointers one down the list
      current.next_node, previous, current = previous, current, current.next_node
    end
    # set the last node to head and point to the previous
    current.next_node, @head= previous, current
  end


   def max
     return nil if @size == 0
     max = @head.value
     current = @head.next_node
     while current != nil
       if current.value > max
         max = current.value
       end
       current = current.next_node
     end
     return max
   end

end
