/*
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 Example 1:
 
 11110
 11010
 11000
 00000
 
 Answer: 1
 
 Example 2:
 
 11000
 11000
 00100
 00011
 
 Answer: 3
 */


class Solution {
    private typealias Point = (row: Int, col: Int)
    private var grid: [[Character]]!
    private var checked = [String: Bool]()
    private func pointIsWithinGrid(_ point: Point) -> Bool {
        return point.col >= 0 && point.row >= 0 && point.row < grid.count && point.col < grid.first!.count
    }
    private func isNewIsland(_ point: Point) -> Bool {
        guard pointIsWithinGrid(point) else { return false }
        guard checked["\(point.row),\(point.col)"] != true else { return false }
        guard grid[point.row][point.col] == Character("1") else { return false }
        
        checked["\(point.row),\(point.col)"] = true
        
        let colOffset = [-1, 0, 1, 0]
        let rowOffset = [0, -1, 0, 1]
        for i in 0..<colOffset.count {
            var neighbor = point
            neighbor.col += colOffset[i]
            neighbor.row += rowOffset[i]
            isNewIsland(neighbor)
        }
        return true
    }
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        self.grid = grid
        var islandCount = 0
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                print(row)
                if isNewIsland((row: row, col: col)) {
                    islandCount += 1
                }
            }
        }
        return islandCount
    }
}

var x = Character("1")
var o = Character("0")

var ocean =  [
    [x,x,x,x,o],
    [x,x,o,x,o],
    [x,x,o,o,o],
    [o,o,o,o,o]
    ]
Solution().numIslands(ocean)

ocean =  [
    [x,x,o,o,o],
    [x,x,o,o,o],
    [o,o,x,o,o],
    [o,o,o,x,x]
]
Solution().numIslands(ocean)