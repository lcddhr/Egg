//
//  RebuildTreeSolution.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class RebuildTreeSolution {
    
    static func rebuildTree(preOrder:[Int], inOrder:[Int]) -> TreeNode? {
        var p = preOrder
        var i = inOrder
        return build(preOrder: &p,
                     inOrder: &i,
                     start: 0,
                     end: p.count - 1)
    }
    
    static func build(preOrder:inout [Int], inOrder: inout [Int], start:Int, end:Int) -> TreeNode? {
        
        if start > end { return nil }
        
        let root = TreeNode(value: preOrder.removeFirst(), left: nil, right: nil)
        
        for index in start...end {
            if inOrder[index] == root.value {
                root.left = build(preOrder: &preOrder,
                                  inOrder: &inOrder,
                                  start: start,
                                  end: index - 1)
                root.right = build(preOrder: &preOrder,
                                   inOrder: &inOrder,
                                   start: index + 1,
                                   end: end)
                break
            }
        }
        return root
    }
}

extension RebuildTreeSolution {
    
    static func test() {
        let preOrder = [1,2,4,7,3,5,6,8]
        let inOrder = [4,7,2,1,5,3,8,6]
        
        guard let root = rebuildTree(preOrder: preOrder, inOrder: inOrder) else {
            print("树重建失败")
            return
        }
        
        TreeOrderSolution.printNode(root: root)
    }
}
