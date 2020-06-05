//
//  ListNode.swift
//  Sword
//
//  Created by liuchendi on 2020/5/30.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

internal class ListNode<T> {
    
    var data: T
    
    // Set this property to weak will lead to crash in iOS 7.
    // Workaround, break strong reference in DList deinit.
    var prev: ListNode<T>?
    
    var next: ListNode<T>?
    
    init(data: T, prev: ListNode? = nil, next: ListNode? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

internal class List<T> {
    
    fileprivate var _head: ListNode<T>?
    fileprivate var _tail: ListNode<T>?
    
    var count: Int = 0
    
    var head: ListNode<T>? {
        return _head
    }
    
    var tail: ListNode<T>? {
        return _tail
    }

    
    // node must be in the list
    func removeNode(_ node: ListNode<T>) {
        
        if node.prev == nil {   // head
            _head = node.next
        } else {
            node.prev!.next = node.next
        }
        
        if node.next == nil {   // tail
            _tail = node.prev
        } else {
            node.next!.prev = node.prev
        }
        
        count -= 1
    }
    
    // remove all nodes
    func removeAll() {
        
        // break cycle reference
        while _head != nil {
            _head!.prev = nil
            _head = _head!.next
        }
        
        _head = nil
        _tail = nil
        
        count = 0
    }
    
    // insert node at head. node must not in the list.
    func insertNode(_ node: ListNode<T>) {
        
        if _head == nil {        // list is empty
            _head = node
            _tail = node
            node.prev = nil
            node.next = nil
        }
        else {                  // insert at head
            _head!.prev = node
            node.next = _head
            node.prev = nil
            _head = node
        }
        
        count += 1
    }
    
    // insert node at tail. node must not in the list.
    func appendNode(_ node: ListNode<T>) {
        
        if _head == nil {       // list is empty
            _head = node
            _tail = node
            node.prev = nil
            node.next = nil
        }
        else {                  // insert at tail
            _tail!.next = node
            node.prev = _tail
            node.next = nil
            _tail = node
        }
        
        count += 1
    }
    
    // all values in order
    func allValues() -> [T] {
        
        var values:[T] = []
        
        var node = head
        while node != nil {
            values.append(node!.data)
            node = node!.next
        }
        
        assert(count == values.count)
        
        return values
    }
    
    // 移除最后一个节点
    func removeLast() {
        guard let tail = tail else { return }
        removeNode(tail)
    }
    
    // 移动某个节点到头部
    func moveToHead(node:ListNode<T>) {
        
        let pre = node.prev
        let next = node.next
        
        // 删除当前节点
        pre?.next  = next
        next?.prev = pre
        
        // 当前节点插入的头部
//        insertNode(node)
        node.next = head
        head?.prev = node
        
        _head = node
        
        if pre == nil { return }
        if next == nil { _tail = pre }
        
    }

    deinit {
        // break cycle reference
        var node = _head
        while node != nil {
            node!.prev = nil
            node = node!.next
        }
    }
}


extension ListNode {
    
    static func buildData() -> ListNode<Int> {
        let one = ListNode<Int>(data: 1, prev: nil, next: nil)
        let two = ListNode<Int>(data: 2, prev: nil, next: nil)
        let three = ListNode<Int>(data: 3, prev: nil, next: nil)
        let four  = ListNode<Int>(data: 4, prev: nil, next: nil)

        one.next = two
        two.next = three
        three.next = four
        return one
    }
    
    static func buildData1() -> ListNode<Int> {
        let one = ListNode<Int>(data: 8, prev: nil, next: nil)
        let two = ListNode<Int>(data: 6, prev: nil, next: nil)
        let three = ListNode<Int>(data: 9, prev: nil, next: nil)
        let four  = ListNode<Int>(data: 3, prev: nil, next: nil)

        one.next = two
        two.next = three
        three.next = four
        return one
    }
    
    
    static func buildData2() -> ListNode<Int> {
    
       let one = ListNode<Int>(data: 5, prev: nil, next: nil)
       let two = ListNode<Int>(data: 2, prev: nil, next: nil)
       let three = ListNode<Int>(data: 4, prev: nil, next: nil)
       let four  = ListNode<Int>(data: 10, prev: nil, next: nil)

       one.next = two
       two.next = three
       three.next = four
       return one
    }
    
    static func printNode(root:ListNode?) {
        var result = root
        while result?.data != nil  {
            print(result?.data)
            result = result?.next
        }
    }
}
