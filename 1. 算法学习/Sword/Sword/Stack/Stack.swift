//
//  Stack.swift
//  Sword
//
//  Created by liuchendi on 2020/5/30.
//  Copyright © 2020 liuchendi. All rights reserved.
//

open class Stack<T> {
    
    fileprivate var _dlist: List<T> = List<T>()
    
    open var count: Int {
        return _dlist.count
    }
    
    public init() {
        
    }
    
    open func isEmpty() -> Bool {
        return _dlist.head == nil
    }
    
    open func top() -> T? {
        return _dlist.head?.data
    }
    
    open func push(_ value: T) {
        _dlist.insertNode(ListNode(data: value))
    }
    
    open func pop() -> T?{
        if let head = _dlist.head {
            _dlist.removeNode(head)
            return head.data
        }
        return nil 
    }
    
}
