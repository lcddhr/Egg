//
//  BackwardsKNode.swift
//  Sword
//
//  Created by liuchendi on 2020/6/5.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class BackwardsKNode<T> {
    
    static func find(root:ListNode<T>?, backward k:Int) -> ListNode<T>?{
        guard let root = root else { return nil }
        guard k > 0 else { return nil }
        
        var count = k
        var fast:ListNode<T>? = root
        var slow:ListNode<T>? = root
        
        while count > 1 , fast != nil {
            fast = fast?.next
            count = count - 1
        }
        
        // K 大于链表长度
        if fast == nil { return nil }
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
}

extension BackwardsKNode {
    
    static func test() {
//        print("")
        let list = ListNode<Int>.buildData()
        
        let result = BackwardsKNode<Int>.find(root: list, backward: 0)
        
        print(result?.data)
        
    }
}
