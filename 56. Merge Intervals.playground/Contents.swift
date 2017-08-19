/*
 Given a collection of intervals, merge all overlapping intervals.
 
 For example,
 Given [1,3],[2,6],[8,10],[15,18],
 return [1,6],[8,10],[15,18].
 */


public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        var mergedIntervals = intervals
        for interval in intervals { //2-6
            var mergedInterval = interval
            var mutableIntervals = [Interval]()
            for otherInterval in mergedIntervals {
                if !(mergedInterval.start == otherInterval.start && mergedInterval.end == otherInterval.end) {
                    if (mergedInterval.start <= otherInterval.start && mergedInterval.end >= otherInterval.start) ||
                        (mergedInterval.start <= otherInterval.end && mergedInterval.end >= otherInterval.end) ||
                        (mergedInterval.start >= otherInterval.start && mergedInterval.end <= otherInterval.end) {
                        mergedInterval.start = min(mergedInterval.start, otherInterval.start)
                        mergedInterval.end = max(mergedInterval.end, otherInterval.end)
                    } else {
                        mutableIntervals.append(otherInterval)
                    }
                }
            }
            mutableIntervals.append(mergedInterval)
            mergedIntervals = mutableIntervals
        }
        return mergedIntervals
    }
}

var intervals = [
    Interval(1, 3),
    Interval(2, 6),
    Interval(8, 10),
    Interval(15, 18)
]
Solution().merge(intervals)

intervals = [
    Interval(1, 4),
    Interval(2, 3)
]
Solution().merge(intervals)
