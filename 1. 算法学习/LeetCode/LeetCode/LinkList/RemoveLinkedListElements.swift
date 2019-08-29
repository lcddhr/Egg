//
//  RemoveLinkedListElements.swift
//  LeetCode
//
//  Created by liuchendi on 2019/8/29.
//  Copyright © 2019 liuchendi. All rights reserved.
//

import Foundation

class RemoveLinkedListElements {
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        let dummy = ListNode(0)
        dummy.next = head
        var current = dummy
        
        while current.next != nil {
            if current.next?.val == val {
                current.next = current.next?.next
            } else {
                current = current.next!
            }
        }
        
        return dummy.next
    }
}
