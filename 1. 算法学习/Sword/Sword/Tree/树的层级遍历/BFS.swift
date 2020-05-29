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
        let node5 = TreeNode(value: 9, left: nil, right: nil)
        let node4 = TreeNode(value: 8, left: nil, right: nil)
        
        let node3 = TreeNode(value: 7, left: nil, right: nil)
        let node2 = TreeNode(value: 6, left: nil, right: nil)
        
        let node1 = TreeNode(value: 5, left: node5, right: node4)
        let node0 = TreeNode(value: 4, left: node3, right: node2)
        
        let root = TreeNode(value: 10, left: node1, right: node0)
     
        let reuslt = printTree(root: root)
        print(reuslt as Any)
    }
}
