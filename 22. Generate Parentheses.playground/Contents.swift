/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]

 */


class Solution {
    func generateParenthesis(open: Int, close: Int) -> [String] {
        guard close > 0 else { return [] }
        guard open > 0 else {
            var output = ""
            for _ in 1...close {
                output += ")"
            }
            return [output]
        }
        var parenthesis = [String]()
        if close > open {
            for option in generateParenthesis(open: open, close: close - 1) {
                parenthesis.append(")" + option)
            }
        }
        for option in generateParenthesis(open: open - 1, close: close) {
            parenthesis.append("(" + option)
        }
        return parenthesis
    }
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        return generateParenthesis(open: n, close: n)
    }
}

Solution().generateParenthesis(3)