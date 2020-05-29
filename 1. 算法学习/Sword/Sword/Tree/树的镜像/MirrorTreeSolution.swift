//
//  MirrorTreeSolution.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class MirrorTreeSolution {
    
    static func isMirror(root:TreeNode?) -> Bool{
        guard let root = root else { return true }
        return compare(left: root.left, right: root.right)
    }
    
    static func compare(left:TreeNode?, right:TreeNode?) -> Bool {
        if left == nil { return (right == nil ) }
        
        guard let right = right else { return false }
        
        guard left?.value == right.value  else { return false }
        
        return compare(left: left?.left, right: right.right) && compare(left: left?.right, right: right.left)
    }
}

extension MirrorTreeSolution {
    
    static func testMirrorTree() {
        
        let node6 = TreeNode(value: 6, left: nil, right: nil)
        let node5 = TreeNode(value: 5, left: nil, right: nil)
        let node4 = TreeNode(value: 4, left: node5, right: node6)
    
        let node1 = TreeNode(value: 4, left: node6, right: node5)
        
        let rootNode = TreeNode(value: 10, left: node1, right: node4)
        let result = isMirror(root: rootNode)
        if result {
            debugPrint("是镜像")
        } else {
            debugPrint("不是镜像")
        }
        
    }
}
