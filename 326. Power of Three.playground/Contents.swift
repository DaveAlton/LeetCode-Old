/*
 Given an integer, write a function to determine if it is a power of three.
 
 Follow up:
 Could you do it without using any loop / recursion?
 */

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        return (1162261467.0).remainder(dividingBy: Double(n)) == 0
    }
}

Solution().isPowerOfThree(27)
Solution().isPowerOfThree(-3)
