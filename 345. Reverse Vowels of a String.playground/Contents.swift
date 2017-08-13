/*
 Write a function that takes a string as input and reverse only the vowels of a string.
 
 Example 1:
 Given s = "hello", return "holle".
 
 Example 2:
 Given s = "leetcode", return "leotcede".
 
 Note:
 The vowels does not include the letter "y".
 */

class Solution {
    func reverseVowels(_ s: String) -> String {
        var vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var stringVowels = Array(s.characters).filter({ vowels.contains("\($0)") })
        var output = ""
        for character in s.characters {
            if vowels.contains("\(character)") {
                output.append(stringVowels.removeLast())
            } else {
                output.append(character)
            }
        }
        return output
    }
}

Solution().reverseVowels("hello")
Solution().reverseVowels("ollo")
Solution().reverseVowels("my")
Solution().reverseVowels("hi")
Solution().reverseVowels("I")
Solution().reverseVowels("hiHO")
