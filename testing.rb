class MyStack
    def initialize
        @store = []
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
    end
end

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
            @stack1 = MyStack.new

            @store = @stack2.dup
        end 
        if @stack1.empty?
            @size.times do 
                @stack1.push(@stack2.pop)
            end
            @stack1.reverse!
            @stack2 = MyStack.new

            @store = @stack1.dup
        end 
    end
end

a = [1,2,3,4,5,6]

window_size = 3

sq = StackQueue.new

sq.size(3)

