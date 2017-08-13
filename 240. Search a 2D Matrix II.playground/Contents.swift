/*
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 
 For example,
 
 Consider the following matrix:
 
 [
 [1,   4,  7, 11, 15],
 [2,   5,  8, 12, 19],
 [3,   6,  9, 16, 22],
 [10, 13, 14, 17, 24],
 [18, 21, 23, 26, 30]
 ]
 
 Given target = 5, return true.
 
 Given target = 20, return false.
 */


class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else { return false }
        guard matrix.first!.count > 0 else { return false }
        let filteredMatrix = matrix.filter({ $0.first! <= target && $0.last! >= target })
        for row in matrix {
            if row.contains(target) {
                return true
            }
        }
        return false
    }
}

Solution().searchMatrix( [
    [1,   4,  7, 11, 15],
    [2,   5,  8, 12, 19],
    [3,   6,  9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
    ], 13)
