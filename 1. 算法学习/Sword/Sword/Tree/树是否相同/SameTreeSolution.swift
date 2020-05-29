//
//  SameTreeSolution.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class SameTreeSolution {
    
    static func isSameTree(firstTree:TreeNode?, secondTree:TreeNode?) -> Bool {
        if firstTree == nil && secondTree == nil { return true }
        guard let first = firstTree, let second = secondTree else { return false }
        
        guard first.value == second.value else { return false }
        return isSameTree(firstTree: first.left, secondTree: second.left) && isSameTree(firstTree: first.right, secondTree: second.right)
    }
}

extension SameTreeSolution {
    
    static func test() {
        
        let one = TreeNode.buildData()
//        let second = TreeNode.buildData()
        let second = TreeNode.buildBSTData()
        
        if isSameTree(firstTree: one, secondTree: second) {
            print("相同")
        } else {
            print("不同")
        }
    }
}
