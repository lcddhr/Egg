//
//  BST.swift
//  Sword
//
//  Created by liuchendi on 2020/5/30.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation


class BST {
    
    // 求二叉树的深度
    static func deepth(root:TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = deepth(root: root.left)
        let right = deepth(root: root.right)
        return 1 + ((left >= right) ?  left : right)
    }
    
    // 判断节点是否存在
    static func isInBST(root:TreeNode?, target:Int) -> Bool {
        guard let root = root else { return false }
        
        if root.value == target { return true }
        
        // 目标值比根节点大
        if root.value < target {
            return isInBST(root: root.right, target: target)
        }
        
        // 目标值比根节点小
        if root.value > target {
            return isInBST(root: root.left, target: target)
        }
        return false
    }
    
    // 添加节点
    static func insertNode(root:TreeNode?, target:Int) -> TreeNode? {
        guard let root = root else { return TreeNode(value: target, left: nil, right: nil)}
        
        if root.value < target {
            root.right = insertNode(root: root.right, target: target)
        }
        
        if root.value > target {
            root.left = insertNode(root: root.left, target: target)
        }
        return root
    }
    
    // 删除节点
    static func deleteNode(root:TreeNode?, target:Int) -> TreeNode? {
        
        // 根节点不存在
        guard let root = root else { return nil }
        
        // 找到对应的节点
        if target == root.value {
            if root.left == nil { return root.right }
            if root.right == nil { return root.left }
            if let minNode = getMinNode(root: root.right) {
                root.value = minNode.value
                root.right = deleteNode(root: root.right, target: minNode.value)
            }
        }
        
        if root.value > target {
            root.left = deleteNode(root: root.left, target: target)
        }
        
        if root.value < target {
            root.right = deleteNode(root: root.right, target: target)
        }
        return root
    }
    
    // 找到二叉树最小的节点
    static func getMinNode(root:TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var result:TreeNode = root
        while result.left != nil  {
            result = result.left!
        }
        return result
    }
}

extension BST {
    
    static func testDeepth() {
        
        let tree = TreeNode.buildBSTData()
        print(deepth(root: tree)) 
    }
    
    static func testValueInBST() {
        let tree = TreeNode.buildBSTData()
        if isInBST(root: tree, target: 4) {
            print("存在")
        } else {
            print("不存在")
        }
    }
    
    static func testInsertNode() {
        let tree = TreeNode.buildBSTData()
        guard let result = insertNode(root: tree, target: 2) else {
            print("树不存在")
            return
        }
        
        TreeOrderSolution.printNode(root: result)
    }
    
    static func testDeleteNode() {
        let tree = TreeNode.buildBSTData()
        
        guard let result = deleteNode(root: tree, target: 4) else {
            print("树不存在")
            return
        }
        
        TreeOrderSolution.printNode(root: result)
    }
}
