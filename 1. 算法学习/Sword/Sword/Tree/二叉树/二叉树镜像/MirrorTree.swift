//
//  MirrorTree.swift
//  Sword
//
//  Created by liuchendi on 2020/5/30.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class MirrorTree {
    
    // 递归版本
    static func mirror(root:TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        guard let left = root.left, let right = root.right else { return root }
        
        let temp = left
        root.left = right
        root.right = temp
        
        if root.left != nil {
            root.left = mirror(root: root.left)
        }
        
        if root.right != nil {
            root.right = mirror(root: root.right)
        }
        
        return root
    }
    
    // 使用栈实现
    static func mirrorByStack(root:TreeNode?) -> TreeNode? {
        guard let root = root else { return nil}
        
        let stack = Stack<TreeNode>()
        stack.push(root)
        
        while stack.count > 0 {
            if let node = stack.pop() {
                let temp = node.left
                node.left = node.right
                node.right = temp
                
                if node.left != nil {
                    stack.push(node.left!)
                }
                
                if node.right != nil {
                    stack.push(node.right!)
                }
            }
        }
        return root
    }
}

extension MirrorTree {
    
    static func test() {
        let root = TreeNode.buildBSTData()
        guard let result = mirror(root: root) else {
            print("树不存在")
            return
        }
        TreeOrderSolution.printNode(root: result)
    }
    
    static func testByStack() {
        let root = TreeNode.buildBSTData()
        guard let result = mirrorByStack(root: root) else {
            print("树不存在")
            return
        }
        TreeOrderSolution.printNode(root: result)
    }
}
