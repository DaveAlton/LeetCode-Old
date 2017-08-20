/*
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 For example,
 Given the following matrix:
 
 [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
 ]
 
 You should return [1,2,3,6,9,8,7,4,5].
 */


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else { return [] }
        guard matrix.count > 1 else { return matrix[0] }
        var matrix = matrix
        var elements = [Int]()
        elements += matrix.removeFirst()
        for i in 0..<matrix.count {
            if matrix[i].count > 0 {
                elements.append(matrix[i].removeLast())
            }
        }
        elements += matrix.removeLast().reversed()
        for i in 0..<matrix.count {
            let i = matrix.count - 1 - i
            if matrix[i].count > 0 {
                elements.append(matrix[i].removeFirst())
            }
        }
        elements += spiralOrder(matrix)
        return elements
    }
}

var matrix = [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
]
Solution().spiralOrder(matrix)

matrix = [
    [ 1, 2,],
    [ 4, 5 ]
]
Solution().spiralOrder(matrix)

matrix = [
    [ 1 ]
]
Solution().spiralOrder(matrix)

matrix = [
    [ 1 ],
    [ 2 ],
    [ 3 ],
]
Solution().spiralOrder(matrix)