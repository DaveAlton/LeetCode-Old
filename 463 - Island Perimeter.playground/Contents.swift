/*
 You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 Example:
 
 [
     [0,1,0,0],
     [1,1,1,0],
     [0,1,0,0],
     [1,1,0,0]
 ]
 
 Answer: 16
 Explanation: The perimeter is the 16 yellow stripes in the image below:
 https://leetcode.com/static/images/problemset/island.png
 */

class Solution {
    var checked = [String: Bool]()
    func pointDescription(_ point: (row: Int, col: Int)) -> String {
        return "\(point.row),\(point.col)"
    }
    func edgesTouchingWater(inGrid grid: [[Int]], fromPoint point: (row: Int, col: Int)) -> Int {
        guard checked[pointDescription(point)] == nil else { return checked[pointDescription(point)]! ? 0 : 1 }
        checked[pointDescription(point)] = grid[point.row][point.col] == 1
        guard grid[point.row][point.col] == 1 else { return 1 }
        
        var edges = 0
        if point.row != grid.count - 1 {
            var bottom = point
            bottom.row += 1
            edges += edgesTouchingWater(inGrid: grid, fromPoint: bottom)
        } else {
            edges += 1
        }
        if point.row != 0 {
            var top = point
            top.row -= 1
            edges += edgesTouchingWater(inGrid: grid, fromPoint: top)
        } else {
            edges += 1
        }
        if point.col != 0 {
            var left = point
            left.col -= 1
            edges += edgesTouchingWater(inGrid: grid, fromPoint: left)
        } else {
            edges += 1
        }
        if point.col != grid[point.row].count - 1 {
            var right = point
            right.col += 1
            edges += edgesTouchingWater(inGrid: grid, fromPoint: right)
        } else {
            edges += 1
        }
        return edges
        
    }
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var edges = 0
        for row in grid.enumerated() {
            for column in row.element.enumerated() {
                if checked[pointDescription((row: row.offset, col: column.offset))] != true {
                    let landEdges = edgesTouchingWater(inGrid: grid, fromPoint: (row: row.offset, col: column.offset))
                    edges = max(landEdges, edges)
                }
            }
        }
        return edges
    }
}

var grid =    [
    [0,1,0,0],
    [1,1,1,0],
    [0,1,0,0],
    [1,1,0,0]
]
Solution().islandPerimeter(grid)

grid = [
    [1]
]
Solution().islandPerimeter(grid)

grid = [
    [1,1]
]
Solution().islandPerimeter(grid)

grid = [
    [1,1,1],
    [1,0,1],
    [1,1,1]
]
Solution().islandPerimeter(grid)
