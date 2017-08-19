/*
 Given a digit string, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png
 
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.characters.count > 0 else { return [] }
        
        let letters: [String: [String]] = [
            "0": ["0"],
            "1": ["1"],
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        
        var combinations = [String]()
        var digits = digits
        let firstDigit = digits.characters.removeFirst()
        if let digitletters = letters["\(firstDigit)"] as? [String] {
            for letter in digitletters {
                let letterCombos = letterCombinations(digits)
                if letterCombos.count > 0 {
                    for combination in letterCombos {
                        combinations.append(letter + combination)
                    }
                } else {
                    combinations.append(letter)
                }
            }

        }
        return combinations
    }
}

Solution().letterCombinations("23")
Solution().letterCombinations("")
