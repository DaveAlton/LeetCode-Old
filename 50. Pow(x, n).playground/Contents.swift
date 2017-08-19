/*
 Implement pow(x, n).
 */


class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        var n = n
        var x = x
        if n < 0 {
            n = -n
            x = 1/x
        }
        return Double(n).remainder(dividingBy: 2) == 0 ? myPow(x * x, n/2) : x * myPow(x * x, n/2)
    }
}

Solution().myPow(2, 2)

Solution().myPow(2, 3)

Solution().myPow(2, 4)

Solution().myPow(4, 2)

Solution().myPow(3, 4)

Solution().myPow(9, 2)

Solution().myPow(34.00515, -3)

Solution().myPow(0.00001, 2147483647)
