//
//  SortedArrayToBST.swift
//  LeetCode
//
//  Created by liuchendi on 2021/11/20.
//  Copyright © 2021 liuchendi. All rights reserved.
//

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return sortedArrayToBSTRec(nums, 0, nums.count - 1)
}

func sortedArrayToBSTRec(_ nums: [Int], _ left: Int, _ right:Int) ->  TreeNode? {
    if (left > right) { return nil }
    
    let mid = (left + right) / 2
    let  root = TreeNode.init(nums[mid])
    root.left = sortedArrayToBSTRec(nums, left, mid - 1)
    root.right = sortedArrayToBSTRec(nums, mid + 1, right)
    return root
}
