/*
 Given an integer, write a function to determine if it is a power of two.
 */

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        return (9007199254740992.0).remainder(dividingBy: Double(n)) == 0
    }
}

Solution().isPowerOfTwo(8)
Solution().isPowerOfTwo(-8)
Solution().isPowerOfTwo(9007199254740992)