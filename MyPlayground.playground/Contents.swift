//: Playground - noun: a place where people can play

import UIKit

//var salaries = [11000.0,22000.0,33000.0,44000.0,55555.0,97688.0,48970.0]
////loop
//var index = 0
//repeat {
//    salaries[index] = salaries[index] + salaries[index] * 0.10
//    index += 1
//} while (index < salaries.count)
//
//for x in 1...5 {
//    print("Index: \(x)")
//}
//
//for index in 0..<salaries.count {
//    salaries[index] = salaries[index] + salaries[index] * 0.10
//}
//
//for salary in salaries {
//    print("Salary: \(salary)")
//}
//
//var airports: [String: String] = ["abc" : "san bay abc"]
//
//airports["def"] = "san bay def"
//print(airports)

let balance = 1
let broke = balance <= 0 ? true : false
print(broke)

let trynum: Int? = nil
let getnum: Int = trynum ?? 1

extension Int {
    func square() -> Int {
        return self * self
    }
}
var value = 10
value.square()




