/*
 Given a string array words, find the maximum value of length(word[i]) * length(word[j]) where the two words do not share common letters. You may assume that each word will contain only lower case letters. If no such two words exist, return 0.
 
 Example 1:
 
 Given ["abcw", "baz", "foo", "bar", "xtfn", "abcdef"]
 Return 16
 The two words can be "abcw", "xtfn".
 
 Example 2:
 
 Given ["a", "ab", "abc", "d", "cd", "bcd", "abcd"]
 Return 4
 The two words can be "ab", "cd".
 
 Example 3:
 
 Given ["a", "aa", "aaa", "aaaa"]
 Return 0
 No such pair of words.
 */


class Solution {
    func maxProduct(_ words: [String]) -> Int {
        var previousWordCharacters = [String: [Character: Bool]]()
        var max = 0
        for word in words {
            previousWordCharacters[word] = [Character: Bool]()
            for character in word.characters {
                previousWordCharacters[word]![character] = true
            }
            for previousWord in previousWordCharacters.keys {
                let smallerWord = previousWord.characters.count < word.characters.count ? previousWord : word
                let largerWord = previousWord.characters.count >= word.characters.count ? previousWord : word
                if smallerWord.characters.count * largerWord.characters.count > max &&
                    previousWordCharacters[smallerWord]!.values.count + previousWordCharacters[largerWord]!.values.count <= 26 {
                    var sharedCharacters = false
                    for character in smallerWord.characters {
                        if previousWordCharacters[largerWord]?[character] == true {
                            sharedCharacters = true
                            break
                        }
                        
                    }
                    if !sharedCharacters {
                        max = smallerWord.characters.count * largerWord.characters.count
                    }
                }
            }
        }
        return max
    }
}

Solution().maxProduct(["abcw", "baz", "foo", "bar", "xtfn", "abcdef"])
Solution().maxProduct(["a", "ab", "abc", "d", "cd", "bcd", "abcd"])
Solution().maxProduct(["a", "aa", "aaa", "aaaa"])








