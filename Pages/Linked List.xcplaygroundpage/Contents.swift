//: [Previous](@previous)

import Foundation

let list = LinkedList<String>()
list.isEmpty   // true
list.first     // nil
list.last

list.append("Hello")
list.isEmpty         // false
list.first!.value
list.last!.value

list.append("World")
list.first!.value    // "Hello"
list.last!.value     // "World"

list.first!.previous          // nil
list.first!.next!.value       // "World"
list.last!.previous!.value    // "Hello"
list.last!.next               // nil

list.nodeAt(0)!.value    // "Hello"
list.nodeAt(1)!.value    // "World"
list.nodeAt(2)           // nil

list[0]   // "Hello"
list[1]   // "World"
// list[2]   // crash!

list.insert("Swift", atIndex: 1)
list[0]     // "Hello"
list[1]     // "Swift"
list[2]     // "World"

list.remove(list.first!)   // "Hello"
list.count                     // 2
list[0]                        // "Swift"
list[1]                        // "World"

//list.removeLast()              // "World"
//list.count                     // 1
//list[0]                        // "Swift"
//
//list.removeAt(0)          // "Swift"
//list.count                     // 0

list

let list2 = LinkedList<String>()
list2.append("Hello")
list2.append("Swifty")
list2.append("Universe")

let m = list2.map { s in s.characters.count }
m

let f = list2.filter { s in s.characters.count > 5 }
f    // [Universe, Swifty]

//: [Next](@next)
