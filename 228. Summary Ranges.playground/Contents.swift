/*
 Given a sorted integer array without duplicates, return the summary of its ranges.
 
 For example, given [0,1,2,4,5,7], return ["0->2","4->5","7"].
 
 Credits:
 Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.
 */


class Solution {
    class SummaryRange {
        var start: Int
        var end: Int?
        var description: String {
            if let end = end, end != start {
                return "\(start)->\(end)"
            } else {
                return "\(start)"
            }
        }
        init(start: Int) {
            self.start = start
        }
    }
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums.count > 0 else { return [] }
        var range: SummaryRange?
        var rangeDescriptions = [String]()
        var previous: Int?
        for num in nums {
            if range == nil {
                range = SummaryRange(start: num)
            }
            if let previous = previous {
                if num - previous > 1 {
                    range?.end = previous
                    rangeDescriptions.append(range!.description)
                    range = SummaryRange(start: num)
                }
            }
            range?.end = num
            previous = num
        }
        rangeDescriptions.append(range!.description)
        return rangeDescriptions
    }
}

Solution().summaryRanges([0,1,2,4,5,7])

Solution().summaryRanges([])

Solution().summaryRanges([0,7])

Solution().summaryRanges([0,1])