/*
 Given a collection of distinct numbers, return all possible permutations.
 
 For example,
 [1,2,3] have the following permutations:
 
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 */

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else { return [nums] }
        var permutations = [[Int]]()
        for i in 0..<nums.count {
            var nums = nums
            let removedDigit = nums.remove(at: i)
            for permutation in permute(nums) {
                permutations.append([removedDigit] + permutation)
            }
        }
        return permutations
    }
}

Solution().permute([1,2,3])
