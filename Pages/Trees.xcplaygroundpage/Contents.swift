//: [Previous](@previous)

import Foundation

let routeCA = Node(value: "canada")

let routeMirador = Node(value: "mirador")
let routeBosque = Node(value: "bosque")

routeCA.add(child: routeMirador)
routeCA.add(child: routeBosque)

print(routeCA)

routeCA.search(value: "bosque")
routeCA.search(value: "canada")

let routeOne = Node(value: 1)
let routeTwo = Node(value: 2)
routeOne.add(child: routeTwo)

print(routeBosque)

//: [Next](@next)
