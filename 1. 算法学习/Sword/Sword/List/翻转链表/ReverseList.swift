//
//  ReverseList.swift
//  Sword
//
//  Created by liuchendi on 2020/6/3.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class ReverseList<T> {
    
    static func reverse(root:ListNode<T>?) -> ListNode<T>? {
        guard let root = root else { return nil }
        
        var current:ListNode<T>? = root
        var next:ListNode<T>? = nil
        var pre:ListNode<T>? = nil
        
        while current != nil  {
            next = current?.next
            current?.next = pre
            pre = current
            current = next
        }
        return pre
    }
}

extension ReverseList {
    
    static func test() {
        
        let one = ListNode<Int>.buildData()
        
        var result = ReverseList<Int>.reverse(root: one)
        
        while result?.data != nil  {
            print(result?.data)
            result = result?.next
        }
        
    }
}

