//
//  SubTreeSolution.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

// 判定给定的树是否属于当前树的子结构
import Foundation

class SubTreeSolution {
    
    // 判断子树是否相同
    static func isExistSubTree(root:TreeNode?, subRoot:TreeNode?) -> Bool {
        guard let subRoot = subRoot else { return true }
        if root?.value != subRoot.value { return false }
        return isExistSubTree(root: root?.left, subRoot: subRoot.left) &&
            isExistSubTree(root: root?.right, subRoot: subRoot.right)
    }
    
    // 判断是否含有子树
    static func hasSubTree(root:TreeNode?, subRoot:TreeNode?) -> Bool {
        guard let root = root, let subRoot = subRoot else { return false }
        var result = false
        if root.value == subRoot.value {
            result = isExistSubTree(root: root, subRoot: subRoot)
        }
        
        if !result {
            result = hasSubTree(root: root.left, subRoot: subRoot)
        }
        
        if !result {
            result = hasSubTree(root: root.right, subRoot: subRoot)
        }
        return result
    }
}

extension SubTreeSolution {
    
    static func testHasSubTree() {

        let node9 = TreeNode(value: 10, left: nil, right: nil)
        let node8 = TreeNode(value: 8, left: nil, right: nil)

        let node7 = TreeNode(value: 7, left: node9, right: node8)

        let node6 = TreeNode(value: 6, left: nil, right: nil)
        let node5 = TreeNode(value: 5, left: nil, right: nil)
        let node4 = TreeNode(value: 4, left: node6, right: node5)

        let rootNode = TreeNode(value: 9, left: node7, right: node4)

        let node3 = TreeNode(value: 10, left: nil, right: nil)
        let node2 = TreeNode(value: 8, left: nil, right: nil)
        let subNode = TreeNode(value: 7, left: node3, right: node2)

        let result = hasSubTree(root: rootNode, subRoot: subNode)
        if result {
            debugPrint("含有相同的子树")
        } else {
            debugPrint("不包含")
        }
    }
}
