/*
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words. You may assume the dictionary does not contain duplicate words.
 
 For example, given
 s = "leetcode",
 dict = ["leet", "code"].
 
 Return true because "leetcode" can be segmented as "leet code".
 */

import Foundation

class Solution {
    private var dict: [String]? {
        didSet {
            reformatDict()
        }
    }
    private var dictionary: [String: Bool]!
    private var dictionaryCharacters: [Character: Bool]!
    private var startingLetters: [Character: Bool]!
    private var maxWordLength = Int.min
    private var memo = [String: Bool]()
    private func reformatDict() {
        dictionary = [String: Bool]()
        dictionaryCharacters = [Character: Bool]()
        startingLetters = [Character: Bool]()
        for word in dict! {
            dictionary[word] = true
            startingLetters[word.characters.first!] = true
            maxWordLength = max(word.characters.count, maxWordLength)
            for character in word.characters {
                dictionaryCharacters[character] = true
            }
        }
    }
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if dict == nil { dict = wordDict }
        for character in s.characters {
            if dictionaryCharacters[character] != true {
                return false
            }
        }
        guard memo[s] != false else { return false }
        guard s.characters.count > 0 else { return true }
        guard dictionary[s] != true else { return true }
        guard startingLetters[s.characters.first!] == true else { return false }
        var characters = Array(s.characters)
        var index = 0
        while index < characters.count && index <= maxWordLength {
            let word = String(characters[0..<index])
            if dictionary[word] == true {
                if wordBreak(String(characters[index...(characters.count - 1)]), wordDict) {
                    return true
                }
            }
            index += 1
        }
        memo[s] = false
        return false
    }
}

var s = "leetcode"
var dict = ["leet", "code"]
Solution().wordBreak(s, dict)

s = "leetcode"
dict = ["lleet", "code"]
Solution().wordBreak(s, dict)

s = "acaaaaabbbdbcccdcdaadcdccacbcccabbbbcdaaaaaadb"
dict = [
    "abbcbda","cbdaaa","b","dadaaad","dccbbbc","dccadd","ccbdbc","bbca","bacbcdd","a","bacb","cbc","adc",
    "c","cbdbcad","cdbab","db","abbcdbd","bcb","bbdab","aa","bcadb","bacbcb","ca","dbdabdb","ccd","acbb",
    "bdc","acbccd","d","cccdcda","dcbd","cbccacd","ac","cca","aaddc","dccac","ccdc","bbbbcda","ba",
    "adbcadb","dca","abd","bdbb","ddadbad","badb","ab","aaaaa","acba","abbb"
]
Solution().wordBreak(s, dict)

s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
dict = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
Solution().wordBreak(s, dict)

s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
dict = ["aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa","ba"]
Solution().wordBreak(s, dict)

s = "aaaaaaa"
dict = ["aaaa","aa"]
Solution().wordBreak(s, dict)

s = "bccdbacdbdacddabbaaaadababadad"
dict = [
    "cbc","bcda","adb","ddca","bad","bbb","dad","dac","ba","aa","bd","abab","bb","dbda","cb","caccc",
    "d","dd","aadb","cc","b","bcc","bcd","cd","cbca","bbd","ddd","dabb","ab","acd","a","bbcc","cdcbd",
    "cada","dbca","ac","abacd","cba","cdb","dbac","aada","cdcda","cdc","dbc","dbcb","bdb","ddbdd","cadaa",
    "ddbc","babb"
]
Solution().wordBreak(s, dict)
