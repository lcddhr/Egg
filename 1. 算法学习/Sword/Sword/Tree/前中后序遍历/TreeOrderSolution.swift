//
//  TreeOrderSolution.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class TreeOrderSolution {
    
    static func preOrder(root:TreeNode?) {
        guard let root = root else { return }
        
        print(root.value)
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
    
    static func inOrder(root:TreeNode?) {
        
        guard let root = root else { return }
        
        inOrder(root: root.left)
        print(root.value)
        inOrder(root: root.right)
    }
    
    static func laterOrder(root:TreeNode?) {
        guard let root = root else { return }
        laterOrder(root: root.left)
        laterOrder(root: root.right)
        print(root.value)
    }
}

extension TreeOrderSolution {
    
    static func printNode(root:TreeNode = TreeNode.buildData()) {
        
        print(" ------ 先序遍历 -------")
        preOrder(root: root)
        
        print(" ------ 中序遍历 -------")
        inOrder(root: root)
        
        print(" ------ 后序遍历 -------")
        laterOrder(root: root)
    }
    
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var list = Array<Int>()
        inorderTraversalRec(root, list: &list)
        return list
    }
    func inorderTraversalRec(_ root:TreeNode?, list:inout Array<Int>) {
        guard let root = root else { return }
        inorderTraversalRec(root.left, list:&list)
        list.append(root.value)
        inorderTraversalRec(root, list: &list)
    }
}
