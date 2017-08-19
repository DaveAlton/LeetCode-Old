/*
 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .
 
 You may assume that the given expression is always valid.
 
 Some examples:
 
 "1 + 1" = 2
 " 2-1 + 2 " = 3
 "(1+(4+5+2)-3)+(6+8)" = 23

 */

import Foundation

class Solution {
    func calculate(_ s: String) -> Int {
        var cleanString = s.replacingOccurrences(of: " ", with: "")
        var multipliers = [1]
        var unbracketedString = ""
        let characters = Array(cleanString.characters)
        var characterIndex = 0
        while characterIndex < cleanString.characters.count {
            let charString = "\(characters[characterIndex])"
            if charString == "+" {
                multipliers.append(1)
                unbracketedString += charString
            } else if charString == "-" {
                multipliers.append(-1)
                unbracketedString += charString
            } else if charString == "(" {
                var closeBracketOffset = 0
                var openBrackets = 0
                for i in characterIndex..<characters.count {
                    if "\(characters[i])" == "(" {
                        openBrackets += 1
                    } else if "\(characters[i])" == ")" {
                        openBrackets -= 1
                    }
                    if openBrackets == 0 {
                        closeBracketOffset = i
                        break
                    }
                }
                let closeBracketIndex = cleanString.index(cleanString.startIndex, offsetBy: closeBracketOffset)
                var bracketString = cleanString.substring(to: closeBracketIndex)
                let openBracketIndex = cleanString.index(cleanString.startIndex, offsetBy: characterIndex + 1)
                bracketString = bracketString.substring(from: openBracketIndex)
                var bracketCalculation = calculate(bracketString)
                if let multiplier = unbracketedString.characters.last {
//                    print(bracketCalculation)
                    if multiplier == Character("-") && bracketCalculation < 0 {
                        bracketCalculation = bracketCalculation * -1
                        unbracketedString.characters.removeLast()
                        multipliers.removeLast()
                        multipliers.append(1)
                        unbracketedString += "+"
                    } else if multiplier == Character("+") && bracketCalculation < 0 {
                        bracketCalculation = bracketCalculation * -1
                        multipliers.removeLast()
                        multipliers.append(-1)
                    }
                }
                unbracketedString += "\(bracketCalculation)"
                characterIndex = closeBracketOffset
            } else {
                unbracketedString += charString
            }
            characterIndex += 1
        }
        
        guard Int(unbracketedString) == nil else { return Int(unbracketedString)! }
        
        var output = 0
        let elements = unbracketedString.characters.split(whereSeparator: { "\($0)" == "+" || "\($0)" == "-" })
        for element in elements.enumerated() {
            if let number = Int(String(element.element)) {
                output += number * multipliers[element.offset]
            }
        }
        return output
    }
}

Solution().calculate("1 + 1")
Solution().calculate(" 2-1 + 2 ")
Solution().calculate("(1+(4+5+2)-3)+(6+8)")
Solution().calculate("2-(5-6)")
Solution().calculate("(5-(1+(5)))")
Solution().calculate("1-(2+3-(4+(5-(1-(2+4-(5+6))))))")
