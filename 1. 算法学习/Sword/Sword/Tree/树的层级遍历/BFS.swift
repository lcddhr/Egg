//
//  BFS.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class BFS {
    
    static func printTree(root: TreeNode?) -> [Int]? {
        
        guard let root = root else { return nil }
        var temp = [TreeNode]()
        temp.append(root)
        
        var result = [Int]()
        
        while !temp.isEmpty {
            let first = temp.first
            temp.remove(at: 0)
            
            if let value = first?.value {
                result.append(value)
            }
            
            
            if let left = first?.left {
                temp.append(left)
            }
            
            if let right = first?.right {
                temp.append(right)
            }
        }
        return result
    }
}

extension BFS {
    
    static func test() {
        let root = TreeNode.buildData()
        let reuslt = printTree(root: root)
        print(reuslt as Any)
    }
}
