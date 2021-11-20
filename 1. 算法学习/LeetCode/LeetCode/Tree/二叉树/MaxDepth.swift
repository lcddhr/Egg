//
//  MaxDepth.swift
//  LeetCode
//
//  Created by liuchendi on 2021/11/20.
//  Copyright © 2021 liuchendi. All rights reserved.
//

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    
    if root == nil { return 0 }
    let left = maxDepth(root?.left)
    let right = maxDepth(root?.right)
    return max(left, right) + 1
}

