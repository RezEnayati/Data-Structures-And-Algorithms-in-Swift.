import Foundation

//Selection Sort
var nums = [2,6,7,19,11,45,99,23,56,78,9]

print("Array Before sorting:")
print(nums)

var minIndex = 0

for i in 0..<nums.count - 1{
    minIndex = i
    for j in (i+1)..<nums.count {
        if nums[j] < nums[minIndex] {
            minIndex = j
        }
    }
    let aux = nums[i]
    nums[i] = nums[minIndex]
    nums[minIndex] = aux
}
print("Array After sorting:")
print(nums)
        
