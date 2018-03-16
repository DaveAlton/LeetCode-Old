/*
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 For example,
 If nums = [1,2,3], a solution is:
 
 [
     [3],
     [1],
     [2],
     [1,2,3],
     [1,3],
     [2,3],
     [1,2],
     []
 ]
 */

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var alreadyContains = [String: Bool]()
        guard nums.count > 1 else { return [nums] + [[]] }
        var output = [[Int]]()
        for i in 0..<nums.count {
            var nums = nums
            let removed = nums.remove(at: i)
            if alreadyContains[[removed].description] != true {
                alreadyContains[[removed].description] = true
                output.append([removed])
            }
            let subsettable = Array(nums[i..<nums.count])
            for subset in subsets(subsettable) {
                let newSubset = [removed] + subset
                if alreadyContains[newSubset.description] != true {
                    alreadyContains[newSubset.description] = true
                    output.append(newSubset)
                }
            }
        }
        output.append([])
        return output
    }
}

Solution().subsets([1,2,3])
Solution().subsets([0])
