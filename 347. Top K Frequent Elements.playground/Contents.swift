/*
 Given a non-empty array of integers, return the k most frequent elements.
 
 For example,
 Given [1,1,1,2,2,3] and k = 2, return [1,2].
 
 Note:
 
 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 */

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencies = [Int: Int]()
        
        for num in nums {
            frequencies[num] = (frequencies[num] ?? 0) + 1
        }
        
        var values = [(num: Int, frequency: Int)]()
        for key in frequencies.keys {
            values.append((num: key, frequency: frequencies[key]!))
        }
        values.sort(by: { $0.frequency > $1.frequency})
        
        var output = [Int]()
        for i in 0..<k {
            output.append(values[i].num)
        }
        return output
    }
}

Solution().topKFrequent([1,1,1,2,2,3], 2)
