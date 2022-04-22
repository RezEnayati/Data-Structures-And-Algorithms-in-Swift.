import Foundation
import Darwin

let intArray = [2,4,2,3,21,2]
let abcArray = ["a","c","v","e","q"]

func findLetterIndex(_ array:[String], letter:String) -> Int? {
    for (index, element) in array.enumerated(){
        if element == letter {
            return index
        }
    }
    return nil
}

func linearSearch<T:Comparable>(_ array:[T], letter:T) -> Int? {
    for (index, element) in array.enumerated(){
        if element == letter {
            return index
        }
    }
    return nil
}

//MARK: -  Generic = Describes a genric size object

