//
//  MergeList.swift
//  Sword
//
//  Created by liuchendi on 2020/6/5.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation
import UIKit

class MergeList {
    
    
    static func merge(firstNode:ListNode<Int>?,
                      secondNode:ListNode<Int>?) -> ListNode<Int>? {
        
        if firstNode == nil && secondNode == nil { return nil }
        guard let _ = firstNode else { return secondNode }
        guard let _ = secondNode else { return firstNode }
        
        var first:ListNode<Int>? = firstNode
        var second:ListNode<Int>? = secondNode
        
        var current:ListNode<Int>?
        
        if first!.data < second!.data {
            current = first
            first = first!.next
        } else {
            current = second
            second = second!.next
        }
        
        var result:ListNode<Int>?  = current
        
 
        while (first != nil) && (second != nil) {
            if first!.data < second!.data {
                current?.next = first
                first = first?.next
            } else {
                current?.next = second
                second = second?.next
            }
            
            current = current?.next
        }
        
        if first != nil  {
            current?.next = first
        }
        
        if second != nil  {
            current?.next = second
        }
        
        return result
        
    }
}

extension MergeList {
    
    static func test() {
        
        let list1 = ListNode<Int>.buildData1()
        let list2 = ListNode<Int>.buildData2()
     
        let result = MergeList.merge(firstNode: list1, secondNode: list2)
        ListNode.printNode(root: result)
        
    }
}
