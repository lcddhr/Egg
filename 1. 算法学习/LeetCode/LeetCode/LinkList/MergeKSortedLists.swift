//
//  MergeKSortedLists.swift
//  LeetCode
//
//  Created by liuchendi on 2019/8/29.
//  Copyright © 2019 liuchendi. All rights reserved.
//

import Foundation

class MergeKSortedLists {
    func mergeKLists(lists: [ListNode?]) -> ListNode? {
        
        if lists.isEmpty { return nil }
        
        var left = 0
        var right = lists.count - 1
        
        var tempLists = lists
        
        while right > 0 {
            left = 0
            while left < right {
                tempLists[left] = _mergeTwoLists(l1: tempLists[left], tempLists[right])
                left += 1
                right -= 1
            }
        }
        return tempLists[0]
    }
    
    private func _mergeTwoLists(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node = dummy
        
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node.next = l1
                l1 = l1?.next
            } else {
                node.next = l2
                l2 = l2?.next
            }
            node = node.next!
        }
        
        node.next = l1 ?? l2
        return dummy.next
    }
}
