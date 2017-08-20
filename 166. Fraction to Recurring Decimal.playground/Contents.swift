/*
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
 
 If the fractional part is repeating, enclose the repeating part in parentheses.
 
 For example,
 
 Given numerator = 1, denominator = 2, return "0.5".
 Given numerator = 2, denominator = 1, return "2".
 Given numerator = 2, denominator = 3, return "0.(6)".

 */

import Foundation

class Solution {
    func repeatingDigits(in fractionString: String) -> String {
        guard fractionString != "0" else { return "" }
        guard fractionString.characters.count > 2 else { return fractionString }
        var characters = Array(fractionString.characters)
        if characters.count > 15 {
            characters.removeLast()
        }
        for repeatLength in 1..<(characters.count - 1) {
            var repeating = true
            for repeatIndex in 0..<(characters.count - 1) {
                if repeatIndex + repeatLength < characters.count - 1 {
                    if characters[repeatIndex] != characters[repeatIndex + repeatLength] {
                        repeating = false
                        break
                    }
                }
            }
            if repeating {
                return "(" + String(characters[0..<repeatLength]) + ")"
            }
        }
        return String(characters[0]) + repeatingDigits(in: String(characters[1..<characters.count]))
    }
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        var fractionString = "\(Double(numerator)/Double(denominator))"
        var digits = Array(fractionString.characters)
        if digits.count > 15 {
            digits.removeLast()
        }
        fractionString = String(digits)
        let decimalIndex = fractionString.characters.index(of: ".")!
        let fractionIndex = fractionString.characters.index(decimalIndex, offsetBy: 1)
        let fractionPrefix = fractionString.substring(to: decimalIndex)
        let repeating = repeatingDigits(in: fractionString.substring(from: fractionIndex))
        if repeating == "" {
            return fractionPrefix
        } else {
            return fractionPrefix + "." + repeating
        }
    }
}

Solution().fractionToDecimal(1, 2)
Solution().fractionToDecimal(2, 1)
Solution().fractionToDecimal(2, 3)
Solution().fractionToDecimal(1, 99)
Solution().fractionToDecimal(1, 6)
Solution().fractionToDecimal(50, 8)
Solution().fractionToDecimal(1, 8)
Solution().fractionToDecimal(1, 17)
