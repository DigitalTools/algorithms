import Foundation

public struct UnionFind<T: Hashable> {
    
    private var index = [T: Int]()
    private var parent = [Int]()
    private var size = [Int]()
    
    public init() {}
    
    public mutating func addSetWith(_ element: T) {
        index[element] = parent.count
        parent.append(parent.count)
        size.append(1)
    }
    
    public mutating func setOf(_ element: T) -> Int? {
        if let indexOfElement = index[element] {
            return setByIndex(indexOfElement)
        } else {
            return nil
        }
    }
    
    // search up to root
    private mutating func setByIndex(_ index: Int) -> Int {
        if parent[index] == index {  // 1
            return index
        } else {
            parent[index] = setByIndex(parent[index])  // 2
            return parent[index]       // 3
        }
    }
    
    // easy
    public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            return firstSet == secondSet
        } else {
            return false
        }
    }
    
    public mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {  // 1
            if firstSet != secondSet {               // 2
                if size[firstSet] < size[secondSet] {  // 3
                    parent[firstSet] = secondSet         // 4
                    size[secondSet] += size[firstSet]    // 5
                } else {
                    parent[secondSet] = firstSet
                    size[firstSet] += size[secondSet]
                }
            }
        }
    }
    
}
