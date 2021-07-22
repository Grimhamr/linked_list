=begin

You will need two classes:

LinkedList class, which will represent the full list.
Node class, containing a #value method and a link to the #next_node, set both as nil by default.
Build the following methods in your linked list class:

#append(value) adds a new node containing value to the end of the list
#prepend(value) adds a new node containing value to the start of the list
#size returns the total number of nodes in the list
#start returns the first node in the list
#end returns the last node in the list
#at(index) returns the node at the given index
#pop removes the last element from the list
#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#find(value) returns the index of the node containing value, or nil if not found.
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.
=end

require_relative "node"

class LinkedList
    attr_accessor :last_node
    def initialize
        @start = nil
        @end = nil
        @size = 0
    end
    
    def change_node(new_node,old_node)
        old_node.next_node = new_node
        new_node.index = old_node.index + 1
        @last_node = new_node
    end

    def append(value)
        new_node = Node.new(value,@end)
        
        
        if @start == nil
            new_node.index = 0
            @start=new_node
            @last_node = new_node
        else
            change_node(new_node,@last_node)
        end
      
        @size += 1
    end
    
    def prepend(value)
        new_node = Node.new(value,@end)
        new_node.index = 0
        if @start == nil
            
            @start=new_node
            @last_node = new_node
        else
            new_node.next_node=@start
            @start=new_node
        end
        
        @size += 1
        index_reset(new_node)
    end

    def index_reset(new_node)
        unless new_node.next_node == nil || new_node.next_node.index == nil 
        
        new_node.next_node.index = new_node.index + 1
        p "#{new_node.next_node.value} index set to  #{new_node.next_node.index}"
        index_reset(new_node.next_node)
        else
            return
        end
    end

    def size
        puts "list size: #{@size}"
    end

    def start
        @start
    end

    def end
        @last_node
    end

    def at(index, node = @start)
        if node.index == index
            return node
        else
            at(index,node.next_node)
        end
    end

    def pop(node = @start)
        if node == nil
            return self
        elsif node.next_node == nil
         
            node.value = nil
            node.index = nil
            node.next_node = nil
            node = nil
        
            return self
        else
            pop(node.next_node)
        end
    end

    def contains?(value, node = @start)
        if node.value == value
            true
        else
            if node.next_node.nil?
                return false 
            end
            contains?(value, node.next_node)
        end

    end

    def find(value, node = @start)
        if node.value == value
            node.index
        else
            if node.next_node.nil?
                return nil 
            end
            find(value, node.next_node)
        end
    end

    def to_s(node = @start)
        p node.value
        @list_string = @list_string.to_s + "#{node.value}"
        if !node.next_node.nil?
            @list_string = @list_string + " -> "
            
            to_s(node.next_node)
        else
           @list_string = @list_string+" -> end"
        end
        puts @list_string
    end

 
end

    

linked_list= LinkedList.new
p "pre append:"
p linked_list
linked_list.prepend("first node")
linked_list.size
linked_list.start
p linked_list
linked_list.append("second node")

p linked_list
linked_list.append("third node")

linked_list.prepend("new first node")
linked_list.size
linked_list.start
linked_list.append("fourth node")
p linked_list
linked_list.size

p "index test"
linked_list.at(0)
p "POPPPIN"
#linked_list.pop
p "popped"

p linked_list
p linked_list.last_node
p "to s"
linked_list.to_s

p "contains"
p linked_list.contains?("one hundredth node")
p linked_list.contains?("third node")
p "find"
p linked_list.find("one hundredth node")
p linked_list.find("third node")

linked_list.insert_at(2,"interjected node")