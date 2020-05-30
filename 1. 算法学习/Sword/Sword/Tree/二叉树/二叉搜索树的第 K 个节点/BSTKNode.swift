//
//  BFTKNode.swift
//  Sword
//
//  Created by liuchendi on 2020/5/30.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation


/*
    给定一棵二叉搜索树，请找出其中的第k大的节点。
    
    解题思路: 二叉搜索树的特点是左子树的值比根节点小, 右子树的值比根节点大。
             很容易想到用中序遍历的方式, 找到第 K 大的节点
 
 */
class BSTKNode {
    
    static func kthNode(root:TreeNode?,  k:Int) -> TreeNode? {
        
        if k <= 0  { return nil }
        
        guard let root = root else { return nil }
        var index = k
        return findKthNode(root: root, index: &index)
    }
    
    
    static func findKthNode(root:TreeNode?, index k:inout Int) -> TreeNode?{
        
        
        var result:TreeNode?
        
        // 找到左子树
        if root?.left != nil {
            result = findKthNode(root: root?.left, index: &k)
        }
        
        if result == nil {
            if k == 1 { result = root }
            k -= 1
        }
        
        if result == nil && root?.right != nil {
            result = findKthNode(root: root?.right, index: &k)
        }
        
        return result
    }
}


extension BSTKNode {
    
    static func test() {
        
        let data = TreeNode.buildBSTData()
        TreeOrderSolution.inOrder(root: data)
        
        
        guard let result = kthNode(root: data, k: 5) else {
           print("未找到")
            return
        }
        
        print("找到了 \(result.value)")
        
    
        
        
        
    }
}
