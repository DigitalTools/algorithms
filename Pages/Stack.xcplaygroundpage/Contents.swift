public struct Stack<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}

var stack = Stack<Int>()

stack.push(10)

stack.push(3)

stack.push(57)

stack.pop()

stack.pop()
