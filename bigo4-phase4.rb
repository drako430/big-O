require 'set'
phase 5

class MinMaxStack
    attr_reader :min, :max
    def initialize
        @store = []
        @min = nil
        @max = nil
    end

    def peek
        @store.first
    end

    def size 
        @store.size
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(rabbit)
        @store << rabbit
        @max = rabbit if @max == nil
        @min = rabbit if @min == nil

        if rabbit > @max
            @max = rabbit
        end
        if rabbit < @min
            @min = rabbit
        end
    end
end

phase 6

class MinMaxStackQueue

    attr_reader :stack1, :stack2
    def initialize
        @stack1 = MinMaxStack.new 
        @stack2 = MinMaxStack.new  
        @size = nil
        @store = []
    end

    def size(window_size)
        @size = window_size
    end

    def enqueue(ele)
        if @stack1.empty? && @stack2.empty?
            @stack1.push(ele)
        end
        if @stack1.empty?
            @stack2.push(ele)
        end
        if @stack2.empty?
            @stack1.push(ele)
        end
    end
    
    def dequeue
        if @stack2.empty?
            @size.times do 
                @stack2.push(@stack1.pop)
            end
            @stack2.reverse!
            @stack1 = MinMaxStack.new

            @store = @stack2.store
        end 
        if @stack1.empty?
            @size.times do 
                @stack1.push(@stack2.pop)
            end
            @stack1.reverse!
            @stack2 = MinMaxStack.new

            @store = @stack1.store
        end 
    end
end

phase 7

def windowed_max_range(array, window_size)
    current_max_range = nil
    array.each_with_index do |ele, i|
        if array[i + window_size - 1] != nil
            max_range = array[i..i + window_size - 1].max - array[i..i + window_size - 1].min
            current_max_range = max_range if current_max_range == nil
            current_max_range = max_range if max_range > current_max_range
        end
    end
    current_max_range
end

#Testing the code

a = [1,2,3,4,5,6]

window_size = 3

mmsq = MinMaxStackQueue.new

mmsq.size(3)

mmsq.stack1.max - mmsq.stack1.min

def windowed_max_range(a, window_size)
    max_range = 0
    a.each_with_index do |ele, i|
        if i == window_size - 1
            mmsq.enqueue(ele)
            next
        end
        if i < window_size
            mmsq.enqueue(ele)
            next
        end
        mmsq.enqueue(ele)
        mmsq.dequeue
        
        if max_range < mmsq.stack1.max - mmsq.stack1.min
            max_range = mmsq.stack1.max - mmsq.stack1.min
        end
    end
    max_range
end



#this returns 
#[2, 3, 4]
#[3, 4, 5]
#[4, 5, 6]
# which is what we need.





store min max
don't' do array slicing
calculate min and max instantenously

MinMaxStackQueue keeps track of min and max in constant time 

MyQueue is the window and as we're' moving through the array - we enqueue and dequeue the next ele and the last ele.
this lets us traverse the array in constant time.
peek returns the top or next element without removing it ([0] element)

making the window a queue will let us not have multiple array slices, but just one slice that we can then modify.

MyStack
removing items from MyQueue takes O(n) time, because as we shift an element - the remaining elements have to be reassigned to new positions in memory. it also still makes finding min and max expensive.
solution - stack.








StackQueue

class StackQueue
    def initialize
        @stack1 = MyStack.new #[]
        @stack2 = MyStack.new #[]
        @stack3 = MyStack.new #[]
        @size = 0
        @store = []
    end

    def size
        @size
    end

    def empty?
    end

    def enqueue
        @stack1.push(ele) # add ele to the end of []
        @stack2.push(ele) # add ele to the end of []
        @stack3.push(ele) # add ele to the end of []
        @size +=1
        @stack3
    end
    
    def dequeue
        (@size - 1).times do
            @stack3.push(@stack2.pop)
        end
        @stack3
    end
end
objective in phase 4 is how on earth do dequeue with O(1) time
set @store to the answers

123456789 (3) 
stack1 = MyStack.new #pretty much the same as []
stack1.push three times
stack2.push three times
123 #set @store to 123

goal: 234

stack1.push(4) #so stack1 becomes 1234
#so stack2 is 1234 is because rn it's the same as stack1
stack3.push(stack2.pop) stack3 becomes 123
stack3.push(stack2.pop) stack3 becomes 12
stack3.push(stack2.pop) stack3 becomes 1
stack3 = 4,3,2
stack3.reverse!
set @store to 234 #which is stack3

goal: 345

stack1 is 1234
stack1.push(5) # so stack1 becomes 12345
stack3.push(5) # so stack3 becomes 2345
stack2 = MyStack.new
stack2.push(stack3.pop)
stack2.push(stack3.pop)
stack2.push(stack3.pop)
stack3 #this becomes 2
stack2 #this becomes 543
stack2.reverse! #this becomes 345
set @store to 345

goal: 456
stack1 is 12345
stack1.push(6) #stack1 becomes 123456
stack2.push(6) #stack2 becomes 3456
stack3 = MyStack.new
stack3.push(stack2.pop)
stack3.push(stack2.pop)
stack3.push(stack2.pop)
stack3 #now this is 654
stack2 #now this is 3
stack3.reverse! #this becomes 456
set @store to 456

goal: 567
stack3.push(7) #this becomes 4567
stack2 = MyStack.new
stack2.push(stack3.pop)
stack2.push(stack3.pop)
stack2.push(stack3.pop)
stack3 #this becomes 4
stack2 #becomes 765
stack2.reverse! #this becomes 567
set @store to 567

goal: 678
stack2.push(8) #this becomes 5678
stack3 = MyStack.new
stack3.push(stack2.pop)
stack3.push(stack2.pop)
stack3.push(stack2.pop)
stack2 #this becomes 5
stack3 #this becomes 876
stack3.reverse! #this becomes 678
set @store to 678

goal:789
stack3.push(9) #becomes 6789
stack2 = MyStack.new
stack2.push(stack3.pop)
stack2.push(stack3.pop)
stack2.push(stack3.pop)
stack3 #becomes 6
stack2 #becomes 987
stack2.reverse! #789
set @store to 789

1234567 (3)
goal 123

goal 234
enqueue(4)

class StackQueue
    def initialize
        @stack1 = MyStack.new 
        @stack2 = MyStack.new 
        @size = nil
        @store = []
    end

    def size(window_size)
        @size = window_size
    end

    def enqueue(ele)
        if @stack1.empty? && @stack2.empty?
            @stack1.push(ele)
        end
        if @stack1.empty?
            @stack2.push(ele)
        end
        if @stack2.empty?
            @stack1.push(ele)
        end
    end
    
    def dequeue
        if @stack2.empty?
            @size.times do 
                @stack2.push(@stack1.pop)
            end
            @stack2.reverse!
            @store = @stack2.dup

            @stack1 = MyStack.new
        end 
        if @stack1.empty?
            @size.times do 
                @stack1.push(@stack2.pop)
            end
            @stack1.reverse!
            @store = @stack1.dup

            @stack2 = MyStack.new
        end 
    end
end

stack1 = 1234
stack2 = empty
goal 234
stack1 = 1
stack2 = 432

-----
stack1 = empty
stack2 = 234
goal 345




----------
stack1 = 123
stack2 = empty

goal 234
stack1.enqueue(4)
stack1 # becomes 1234
@size.times do #that's 3 times
    stack2.push(stack1.pop)
end
stack1 #becomes 1
stack2 #becomes 432
stack2.reverse! #becomes 234
set @store to stack2




123 stack 1
1234 stack 1
432 stack 3 (stack 2 - 1) #we can pop all of these eles again to put them in order but then we'd prob need like 4 stacks lol 
12345 stack 1

we want a stack that also keeps track of the max/min element in it (keep track of current min, current max, push those as well, and then update if needed based on the new element; when its popped you can restore the old current_min and current_max by popping them back off)

we can make a queue out of two of these stacks
(have an input stack to enqueue and an output stack to dequeue; if you dequeue and the output stack is empty, pop the input stack until its empty pushing each of these elements into the output stack, effectively inverting their order)

and then you can check the size of said queue to enforce the window size (queue.dequeue if queue.size > window_size), and keep track of the max range seen so far (queue.max - queue.min)




discuss how to create a queue using push and pop from the MyStack so that it takes O(1) time to dequeue this queue.

stack = [123] 
enqueue - stack.push(rabbit)
stack = [1234]
stack2 = [1234]
dequeue - stack2.pop times 3 => 432
stack2 = stack
one stack should be for pushing
one stack should be for popping

enqueue - stack.push
[12345]
dequeue - stack.pop times 3 => 543
12345 (3)
123
1234
234
345


array = [1, 2, 3, 4, 5, 6, 7] 4
1234
2345
3456
4567
solve how to dequeue an array in O(1) time

stack1 = 1234
stack2 = 
stack3 = 

#using shift would be O(n) time, because as we shift the first ele, we have reassign the positions of all of the other elements in the array.

enqueue:
stack1.push(5) #so stack1 becomes [1,2,3,4,5]
stack2 = stack1 #so stack2 becomes [1,2,3,4,5]
dequeue:
@store = []
@store << stack2.pop
@store << stack2.pop
@store << stack2.pop
@store << stack2.pop
@store # [5432] which is the same range as [2345]

size, empty?, enqueue, dequeue

def enqueue



























until stack1.length == 3
    stack1.push(stack2.pop)
array = 12345
stack2 = [123456] => stack 1 = [6] stack2 = [12345]
=> stack 1 = [65] stack2 = [1234]
=> stack 1 = [654] stack2 = [123]

stack [654]
enqueue(10)
stack[10 6 5]

now that length is 3 when someone calls the method enqueue, we would pop last element and push it to the queue



queue - []
queue, we would prob use peek because it doesn't' remove the first ele so it's' still O(1) - not sure 

stromae

maestro

quand c'est' means when?
cancer
initialize one stack, 