/*
 Suppose we abstract our file system by a string in the following manner:
 
 The string "dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext" represents:
 
 dir
 subdir1
 subdir2
 file.ext
 
 The directory dir contains an empty sub-directory subdir1 and a sub-directory subdir2 containing a file file.ext.
 
 The string "dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext" represents:
 
 dir
 subdir1
 file1.ext
 subsubdir1
 subdir2
 subsubdir2
 file2.ext
 
 The directory dir contains two sub-directories subdir1 and subdir2. subdir1 contains a file file1.ext and an empty second-level sub-directory subsubdir1. subdir2 contains a second-level sub-directory subsubdir2 containing a file file2.ext.
 
 We are interested in finding the longest (number of characters) absolute path to a file within our file system. For example, in the second example above, the longest absolute path is "dir/subdir2/subsubdir2/file2.ext", and its length is 32 (not including the double quotes).
 
 Given a string representing the file system in the above format, return the length of the longest absolute path to file in the abstracted file system. If there is no file in the system, return 0.
 
 Note:
 
 The name of a file contains at least a . and an extension.
 The name of a directory or sub-directory will not contain a ..
 
 Time complexity required: O(n) where n is the size of the input string.
 
 Notice that a/aa/aaa/file1.txt is not the longest file path, if there is another path aaaaaaaaaaaaaaaaaaaaa/sth.png.
 */

import Foundation

class Solution {
    class Folder: Item {
        var contents = [Item]()
    }
    class Item {
        var name: String
        init(_ name: String) {
            self.name = name
        }
    }
    func transformToFilesystem(_ input: String) -> [Item] {
        let itemStrings = input.characters.split(separator: "\n").map(String.init)
        var items = [Item]()
        for itemString in itemStrings.enumerated() {
            if !itemString.element.contains("\t") {
                if itemString.element.contains(".") {
                    items.append(Item(itemString.element))
                } else {
                    let folder = Folder(itemString.element)
                    items.append(folder)
                    var filesString = ""
                    var finished = false
                    for i in min(itemString.offset + 1, itemStrings.count - 1)..<itemStrings.count {
                        let components = itemStrings[i].components(separatedBy: "\t")
                        if components.count >= 2 && !finished {
                            if filesString != "" {
                                filesString += "\n"
                            }
                            for _ in 0..<components.count - 2 {
                                filesString += "\t"
                            }
                            filesString += components.last!
                        } else if !finished {
                            folder.contents = transformToFilesystem(filesString)
                            finished = true
                        }
                    }
                    if !finished {
                        folder.contents = transformToFilesystem(filesString)
                    }
                }
            }
        }
        return items
    }
    func longestPath(_ item: Item) -> String {
        guard item is Folder else { return item.name }
        var longest = ""
        if let folder = item as? Folder {
            for item in folder.contents {
                if item is Folder {
                    let itemPath = longestPath(item)
                    if itemPath != "" {
                        let path = "/" + item.name + itemPath
                        if path.characters.count > longest.characters.count {
                            longest = path
                        }
                    }
                } else {
                    if item.name.characters.count + 1 > longest.characters.count {
                        longest = "/" + item.name
                    }
                    
                }
            }
        }
        return longest
    }
    func lengthLongestPath(_ input: String) -> Int {
        let filesystem = transformToFilesystem(input)
        var longest = 0
        for item in filesystem {
            if item is Folder {
                let itemPath = longestPath(item)
                if itemPath != "" {
                    let path = item.name + itemPath
                    longest = max(longest, path.characters.count)
                }
            } else {
                if longest < item.name.characters.count {
                    longest = item.name.characters.count
                }
            }
        }
        return longest
    }
}

//dir
//  subdir1
//    file1.ext
//    subsubdir1
//  subdir2
//    subsubdir2
//      file2.ext
Solution().lengthLongestPath("dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext")
Solution().lengthLongestPath("dir\n\tsubdir1")
Solution().lengthLongestPath("a")
Solution().lengthLongestPath("dir\n\t        file.txt\n\tfile2.txt")








