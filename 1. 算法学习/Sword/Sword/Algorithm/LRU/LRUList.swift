//
//  LRUStack.swift
//  Sword
//
//  Created by liuchendi on 2020/6/2.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

// LRU 算法链表实现

class LRUList<T> {
    var limit: Int
    var cache: List<T>
    init(cacheCount:Int) {
        self.limit = cacheCount
        self.cache = List<T>()
    }
    
    // 添加数据
    func add(value:T) {
        if cache.count == limit { cache.removeLast() }
        let node =  ListNode(data: value, prev: nil, next: nil)
        cache.insertNode(node)
    }
    
    // 删除数据
    func move(value:ListNode<T>) {
        cache.moveToHead(node: value)
    }
}

extension LRUList {
    
    static func test() {
        let list = LRUList<Dictionary<String, String>>(cacheCount: 5)
        list.add(value: ["3":"测试3"])
        list.add(value: ["4":"测试4"])
        list.add(value: ["5":"测试5"])
        list.add(value: ["6":"测试6"])
        list.add(value: ["7":"测试7"])
        
        list.cache.log()
        
        list.fetch(key: "5")
        
        list.cache.log()
    }
}

extension List where T == Dictionary<String, String> {
    
    func contains(name:String) -> ListNode<Dictionary<String, String>>? {
        var next = head
        var index = 0
        while index < count {
            if (next?.data[name]) != nil  { return next }
            index += 1
            next = next?.next
        }
        return nil
    }
    
    // 打印 log 信息
    func log() {
        var next = head
        while next != nil {
            print(next?.data as Any)
            next = next?.next
        }
    }
}

extension LRUList where T == Dictionary<String, String> {
    
    // 访问已有的数据
    func fetch(key : String) {
        if let node = cache.contains(name: key) {
            
            print("访问数据: \(node.data)")
            move(value: node)
        }
    }
}
