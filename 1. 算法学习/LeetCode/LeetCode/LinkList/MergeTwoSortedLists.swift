//
//  MergeTwoSortedLists.swift
//  LeetCode
//
//  Created by liuchendi on 2019/8/28.
//  Copyright © 2019 liuchendi. All rights reserved.
//

import Foundation

class MergeTwoSortedLists {
    
    func mergeTwoLists(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let dummy = ListNode(0)
        var current = dummy
        
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            
            if l1!.val < l2!.val {
                current.next = l1
                l1 = l1?.next
            } else {
                current.next = l2
                l2 = l2?.next
            }
            current = current.next!
        }
        
        current.next = l1 ?? l2
        return dummy
    }
}
