/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 */


class Solution {
    func isValid(_ s: String) -> Bool {
        var openBrackets = ["(", "{", "["]
        var closeBrackets = ["(":")", "{":"}", "[":"]"]
        var currentOpenBrackets = [Character]()
        for bracket in s.characters {
            if openBrackets.contains("\(bracket)") {
                currentOpenBrackets.append(bracket)
            } else {
                if let currentOpenBracket = currentOpenBrackets.last,
                    let closeBracket = closeBrackets["\(currentOpenBracket)"] {
                    if closeBracket == "\(bracket)" {
                        currentOpenBrackets.removeLast()
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        return currentOpenBrackets.count == 0
    }
}

Solution().isValid("()")
Solution().isValid("()[]{}")
Solution().isValid("(]")
Solution().isValid("([)]")
Solution().isValid("()(")
Solution().isValid("]")
