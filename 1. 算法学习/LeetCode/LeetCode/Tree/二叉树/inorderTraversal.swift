//
//  inorderTraversal.swift
//  LeetCode
//
//  Created by liuchendi on 2021/11/20.
//  Copyright © 2021 liuchendi. All rights reserved.
//
//  94 二叉树的中序遍历
//
import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
      var list = Array<Int>()
      inorderTraversalRec(root, list: &list)
      return list
}

func inorderTraversalRec(_ root: TreeNode? , list:inout Array<Int>) {
  
  guard let root = root else { return }
  inorderTraversalRec(root.left, list:&list)
  list.append(root.val)
  inorderTraversalRec(root.right, list: &list)
}
