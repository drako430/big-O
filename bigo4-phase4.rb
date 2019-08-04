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
    def initialize
        @store = MinMaxStack.new
        @store2 = MinMaxStack.new
    end

    def size 
        @store.size
    end

    def empty?
        @store.empty?
    end

    def enqueue(rabbit)
        @store.push(rabbit)
    end

    def dequeue
        if @store2.empty? 
        @store2.push(@store.pop)
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