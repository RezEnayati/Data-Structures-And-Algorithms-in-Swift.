import Foundation

//Binary search, in order for binary search to work, the array has to be sorted.

let numbers = [1,5,15,17,19,22,24,31,105,150]

var lowerBound = 0 //index
var upperBound = numbers.count - 1
var middle = 0
var found = false
let valueToSearch = 22 //The value we are searching for


while (lowerBound <= upperBound) {
    
    //find the middle of the array
    middle = (lowerBound + upperBound) / 2
    
    if (numbers[middle] == valueToSearch) {
        found = true
        break
    } else if (numbers[middle] < valueToSearch){
        lowerBound = middle + 1
    } else {
        upperBound = middle - 1
    }
}
//print(found)

//Making the code morer usable with extensions on the array

extension Array where Iterator.Element == Int {
    
    func containsUsingBS(_ value: Int) -> Bool{
        
        var lowerBound = 0 //index
        var upperBound = self.count - 1
        var middle = 0
        var found = false

        while (lowerBound <= upperBound) {
            
            //find the middle of the array
            middle = (lowerBound + upperBound) / 2
            
            if (numbers[middle] == value) {
                found = true
                break
            } else if (numbers[middle] < value){
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }
        }
        return found
    }
}

print(numbers.containsUsingBS(000))
