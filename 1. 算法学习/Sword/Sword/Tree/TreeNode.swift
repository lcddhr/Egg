//
//  TreeNode.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class TreeNode {
    var value:Int
    var left:TreeNode?
    var right:TreeNode?
    
    init(value:Int, left:TreeNode?, right:TreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension TreeNode {
    
    static func buildData() -> TreeNode {
        let node5 = TreeNode(value: 9, left: nil, right: nil)
        let node4 = TreeNode(value: 8, left: nil, right: nil)
        
        let node3 = TreeNode(value: 7, left: nil, right: nil)
        let node2 = TreeNode(value: 6, left: nil, right: nil)
        
        let node1 = TreeNode(value: 5, left: node5, right: node4)
        let node0 = TreeNode(value: 4, left: node3, right: node2)
        
        let root = TreeNode(value: 10, left: node1, right: node0)
        return root
    }
    
    static func buildBSTData() -> TreeNode {
       
        let node5 = TreeNode(value: 3, left: nil, right: nil)
        let node4 = TreeNode(value: 5, left: nil, right: nil)
        
        let node3 = TreeNode(value:7, left: nil, right: nil)
        let node2 = TreeNode(value: 9, left: nil, right: nil)
        
        let node1 = TreeNode(value: 4, left: node5, right: node4)
        let node0 = TreeNode(value: 8, left: node3, right: node2)
        
        let root = TreeNode(value: 6, left: node1, right: node0)
        return root
    }
}
