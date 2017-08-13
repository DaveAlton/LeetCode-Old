/*
 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements of [1, n] inclusive that do not appear in this array.
 
 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 
 Example:
 
 Input:
 [4,3,2,7,8,2,3,1]
 
 Output:
 [5,6]
 */

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard let max = nums.max() else { return [] }
        var disappearedNumbers = [Int]()
        var previous = 0
        for num in nums.sorted() {
            if num - previous > 1 {
                for i in (previous + 1)..<num {
                    disappearedNumbers.append(i)
                }
            }
            previous = num
        }
        if nums.count > max {
            for num in (max + 1)...nums.count {
                disappearedNumbers.append(num)
            }
        }
        return disappearedNumbers
    }
}

Solution().findDisappearedNumbers([4,3,2,7,8,2,3,1])
Solution().findDisappearedNumbers([1,1])