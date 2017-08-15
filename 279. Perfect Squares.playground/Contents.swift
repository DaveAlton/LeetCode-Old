/*
 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
 
 For example, given n = 12, return 3 because 12 = 4 + 4 + 4; given n = 13, return 2 because 13 = 4 + 9.
 */

import Foundation

class Solution {
    var memo = [Int: Int]()
    var squares: [Int]?
    var runningMin = Int.max
    var initialValue: Int?
    func availableSquares(_ n: Int) -> [Int] {
        if squares == nil {
            squares = [Int]()
            var iteration = 1.0
            while Int(pow(iteration, 2)) <= n {
                squares!.append(Int(pow(iteration, 2)))
                iteration += 1
            }
            squares = squares!.reversed()
        }
        return squares!.filter({ $0 <= n })
    }
    func numSquares(_ n: Int, currentCount: Int = 0) -> Int {
        guard currentCount < runningMin else { return n }
        guard memo[n] == nil else { return memo[n]! }
        guard n > 0 else { return 0 }
        if initialValue == nil {
            initialValue = n
        }
        var minPossibility = Int.max
        for square in availableSquares(n) {
            if square == n {
                minPossibility = 1
                break
            }
            let minSquares = numSquares(n - square, currentCount: currentCount + 1)
            let possibility = 1 + minSquares
            minPossibility = min(minPossibility, possibility)
            if initialValue! == n {
                runningMin = min(runningMin, minPossibility)
            }
        }
        memo[n] = minPossibility
        return minPossibility
    }
}

Solution().numSquares(3)
Solution().numSquares(8)
Solution().numSquares(12)
Solution().numSquares(41)
Solution().numSquares(45)
Solution().numSquares(3081)
Solution().numSquares(7168)
