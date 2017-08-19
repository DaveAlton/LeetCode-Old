/*
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 
 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 
 The replacement must be in-place, do not allocate extra memory.
 
 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 */


class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var indexChanged = nums.count - 1
        var index1: Int?
        var index2: Int?
        for i in 0..<nums.count {
            let latterIndex = nums.count - i - 1
            for j in 0...latterIndex {
                let earlierIndex = latterIndex - j
                if nums[latterIndex] > nums[earlierIndex] {
                    if earlierIndex >= index1 ?? 0 {
                        if index2 != nil {
                            if nums[latterIndex] < nums[index2!] || earlierIndex > index1 ?? 0 {
                                index1 = earlierIndex
                                index2 = latterIndex
                            }
                        } else {
                            index1 = earlierIndex
                            index2 = latterIndex
                        }
                    }
                }
            }
        }
        
        if let index1 = index1, index2 != nil {
            nums.insert(nums.remove(at: index2!), at: index1)
            index2 = (index1 ?? 0)
        } else {
            index2 = -1
        }
        nums = nums[0..<(index2!+1)] + nums[(index2! + 1)..<nums.count].sorted()
    }
}

var numbers = [1,2,3]
Solution().nextPermutation(&numbers)

numbers = [3,2,1]
Solution().nextPermutation(&numbers)

numbers = [1,1,5]
Solution().nextPermutation(&numbers)

numbers = [2,3,1]
Solution().nextPermutation(&numbers)

numbers = [1]
Solution().nextPermutation(&numbers)

numbers = [3,2,4,1]
Solution().nextPermutation(&numbers)

numbers = [1,3,2]
Solution().nextPermutation(&numbers)

numbers = [5,4,7,5,3,2]
Solution().nextPermutation(&numbers)

////4203022
numbers = [4,2,0,2,3,2,0]
Solution().nextPermutation(&numbers)
