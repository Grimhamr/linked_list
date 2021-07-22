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

list
contains:
    start
        denotes start
    item
        each item leads to the next
        contains a name(?) and information
    end
        denotes end



actions
    create start and end
    create #append
=end
require_relative "node"

class LinkedList
    
    def initialize
        @start = nil
        @end = nil
        @size = 0
    end
    
    def change_node(new_node,old_node)
        old_node.next_node = new_node
        @last_node = new_node
    end

    def append(value)
        new_node = Node.new(value,@end)
        
        
        if @start == nil
            @start=new_node
            @last_node = new_node
        else
            #make new_node the next_node of @start. make method? at node?

            change_node(new_node,@last_node)
        end
        p "appended new node"
        @size += 1
    end
    

    def prepend(value)
        new_node = Node.new(value,@end)

        if @start == nil
            p"1"
            @start=new_node
            @last_node = new_node
        else
            p"2"
            new_node.next_node=@start
            @start=new_node
        end
        @size += 1
    end

    def size
        puts "list size: #{@size}"
    end

    def start
        p @start
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
linked_list.append("last node")
p linked_list
linked_list.size


