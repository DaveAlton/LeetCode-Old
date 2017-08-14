/*
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
 
 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
 
 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 
 Write a function to compute the next state (after one update) of the board given its current state.
 
 Follow up:
 
 Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.
 In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?
 */


class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        func pointIsWithinBoard(x: Int, y: Int) -> Bool {
            return y >= 0 && x >= 0 && y < board.count && x < board.first!.count
        }
        let overpopulation = 4
        let underpopulation = 1
        let reproduction = 3
        
        let dead = 0
        let alive = 1
        let willBecomeAlive = 2
        let willBecomeDead = 3
        
        let xOffsets = [-1, 0, 1, -1, 1, -1, 0, 1]
        let yOffsets = [-1, -1, -1, 0, 0, 1, 1, 1]
        
        for y in 0..<board.count {
            for x in 0..<board[y].count {
                var populationCount = 0
                for offset in 0..<xOffsets.count {
                    if pointIsWithinBoard(x: x + xOffsets[offset], y: y + yOffsets[offset]) {
                        if board[y + yOffsets[offset]][x + xOffsets[offset]] == alive || board[y + yOffsets[offset]][x + xOffsets[offset]] == willBecomeDead {
                            populationCount += 1
                        }
                    }
                }
                if board[y][x] == alive {
                    if populationCount <= underpopulation {
                        board[y][x] = willBecomeDead
                    } else if populationCount >= overpopulation {
                        board[y][x] = willBecomeDead
                    }
                } else {
                    if populationCount == reproduction {
                        board[y][x] = willBecomeAlive
                    }
                }
            }
        }
        
        for y in 0..<board.count {
            for x in 0..<board[y].count {
                if board[y][x] == willBecomeDead {
                    board[y][x] = dead
                } else if board[y][x] == willBecomeAlive {
                    board[y][x] = alive
                }
            }
        }
    }
}

// [[]]
var board = [[Int]]()
Solution().gameOfLife(&board)

// [
//   [0,0,0,0,0],
//   [0,0,0,0,0],
//   [0,1,1,1,0],
//   [0,0,0,0,0],
//   [0,0,0,0,0]
// ]
board = [
    [0,0,0,0,0],
    [0,0,1,0,0],
    [0,0,1,0,0],
    [0,0,1,0,0],
    [0,0,0,0,0]
]
Solution().gameOfLife(&board)

// [[0,0]]
board = [[0,0]]
Solution().gameOfLife(&board)
