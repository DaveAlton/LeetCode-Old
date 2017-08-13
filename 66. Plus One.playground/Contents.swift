/*
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        guard digits.count > 0 else { return [1] }
        if digits.last! == 9 {
            return self.plusOne(Array(digits[0..<(digits.count - 1)])) + [0]
        } else {
            var digits = digits
            digits[(digits.count - 1)] += 1
            return digits
        }
    }
}

Solution().plusOne([1,0,1])
Solution().plusOne([9,9])
Solution().plusOne([0])