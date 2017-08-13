/*
 A peak element is an element that is greater than its neighbors.
 
 Given an input array where num[i] ≠ num[i+1], find a peak element and return its index.
 
 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
 
 You may imagine that num[-1] = num[n] = -∞.
 
 For example, in array [1, 2, 3, 1], 3 is a peak element and your function should return the index number 2.
 */


class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var previous = (offset: 0, element: 0)
        var possiblePeak = (offset: 0, element: 0)
        let nums = nums + [Int.min]
        for num in nums.enumerated() {
            if previous.element < possiblePeak.element && num.element < possiblePeak.element {
                return possiblePeak.offset
            }
            previous = possiblePeak
            possiblePeak = num
        }
        return 0
    }
}

Solution().findPeakElement([1, 2, 3, 1])
Solution().findPeakElement([1,2])