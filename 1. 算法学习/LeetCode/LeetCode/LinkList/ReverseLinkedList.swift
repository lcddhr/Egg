//
//  ReverseLinkedList.swift
//  LeetCode
//
//  Created by liuchendi on 2019/8/28.
//  Copyright © 2019 liuchendi. All rights reserved.
//

import Foundation

public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init( _ val: Int) {
        self.val = val
        self.next = nil 
    }
}
class ReverseLinkedList {
    
    func reverseList(head: ListNode?) -> ListNode? {
        var pre:ListNode?
        var next: ListNode?
        var current = head
        while  current != nil  {
            next = current?.next
            current?.next = pre
            pre = current
            current = next
        }
        return pre
    }
}
