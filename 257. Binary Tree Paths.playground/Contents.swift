/*
 Given a binary tree, return all root-to-leaf paths.
 
 For example, given the following binary tree:
 
   1
  / \
 2   3
  \
   5
 
 All root-to-leaf paths are:
 
 ["1->2->5", "1->3"]
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        var treePaths = [String]()
        var prefix = "\(root.val)"
        var paths = binaryTreePaths(root.left) + binaryTreePaths(root.right)
        if paths.count == 0 {
            treePaths.append(prefix)
        }
        for path in paths {
            treePaths.append(prefix + "->" + path)
        }
        return treePaths
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.right = TreeNode(5)
Solution().binaryTreePaths(root)

root.left?.left = TreeNode(4)
Solution().binaryTreePaths(root)
