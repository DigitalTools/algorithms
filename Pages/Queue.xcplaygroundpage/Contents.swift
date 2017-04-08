public struct Queue<T> {
    fileprivate var array = [T?]()
    private var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        //let percentage = Double(head)/Double(array.count)
        //if array.count > 50 && percentage > 0.25 {
        if head > 2 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public func peek() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

var q = Queue<String>()
q.array                   // [] empty array

q.enqueue("Ada")
q.enqueue("Steve")
q.enqueue("Tim")
q.array             // [{Some "Ada"}, {Some "Steve"}, {Some "Tim"}]
q.count             // 3

q.dequeue()         // "Ada"
q.array             // [nil, {Some "Steve"}, {Some "Tim"}]
q.count             // 2

q.dequeue()         // "Steve"
q.array             // [nil, nil, {Some "Tim"}]
q.count             // 1

q.enqueue("Grace")
q.array             // [nil, nil, {Some "Tim"}, {Some "Grace"}]
q.count             // 2

q.dequeue()         // "Tim"
q.array             // [{Some "Grace"}]
q.count             // 1

