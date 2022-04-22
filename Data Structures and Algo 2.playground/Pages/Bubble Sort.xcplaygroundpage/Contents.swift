import Foundation

//MARK: -  Bubble sorrting: using two for loops to iterrate and compare the number in the array one by one.


var nums = [100, 45, 34, 24, 23, 10, 8, 6, 5]

print("Array Before sorting:")
print(nums)
 
for i in 0..<nums.count {
    for j in 0..<nums.count {
        
        if(nums[i] < nums[j]) {
            
            //swap the nums
            let temp = nums[i]
            nums[i] = nums [j]
            nums[j] = temp
            
            //To reduce the code you can use the built in swift function in the next line which will replace the 3 lines above.
            //nums.swapAt(i, j)
        }
    }
}
print("Array after sorting:")
print(nums)
