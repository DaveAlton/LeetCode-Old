/*
 Given n balloons, indexed from 0 to n-1. Each balloon is painted with a number on it represented by array nums. You are asked to burst all the balloons. If the you burst balloon i you will get nums[left] * nums[i] * nums[right] coins. Here left and right are adjacent indices of i. After the burst, the left and right then becomes adjacent.
 
 Find the maximum coins you can collect by bursting the balloons wisely.
 
 Note:
 (1) You may imagine nums[-1] = nums[n] = 1. They are not real therefore you can not burst them.
 (2) 0 ≤ n ≤ 500, 0 ≤ nums[i] ≤ 100
 
 Example:
 
 Given [3, 1, 5, 8]
 
 Return 167
 
 nums = [3,1,5,8] --> [3,5,8] -->   [3,8]   -->  [8]  --> []
 coins =  3*1*5      +  3*5*8    +  1*3*8      + 1*8*1   = 167

 */


class Solution {
    func getValue(nums: [Int], i: Int) -> Int {
        guard i >= 0 && i < nums.count else { return 1 }
        return nums[i]
    }
    func maxCoins(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var memo = [Int: [Int: Int]]()
        for len in 1...nums.count {
            for start in 0...nums.count {
                let end = start + len - 1
                for i in start...end {
                    var coins = getValue(nums: nums, i: i) * getValue(nums: nums, i: start - 1) * getValue(nums: nums, i: end + 1)
                    coins += i != start ? memo[start]?[i - 1] ?? 0 : 0
                    coins += i != end ? memo[i + 1]?[end] ?? 0 : 0
                    if memo[start] == nil {
                        memo[start] = [Int: Int]()
                    }
                    memo[start]?[end] = max(memo[start]?[end] ?? 0, coins)
                }
            }
        }
        return memo[0]![nums.count - 1]!
    }
}

Solution().maxCoins([3,1,5,8])

Solution().maxCoins([35,16,83,87,84,59,48,41,20,54])

Solution().maxCoins([1,6,8,3,4,6,4,7,9,8,0,6,2,8])

Solution().maxCoins([4,8,5,1,7,7,3,4,9,8,4,2,1,9,7,8,6,2,5,9,9,7,2,9,7,7,8,9,2,6,8,1,5,2,3,9,0,9,1,2,9,0,9,3,3,6,4,9])
