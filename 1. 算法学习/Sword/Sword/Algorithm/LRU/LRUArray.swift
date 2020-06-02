//
//  LRU.swift
//  Sword
//
//  Created by liuchendi on 2020/6/2.
//  Copyright © 2020 liuchendi. All rights reserved.
//
import Foundation


extension Array where Element:Equatable {
    mutating func remove(object:Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
}

// LRU 算法数组实现
class LRUArray<T:Equatable> {
    
    var cache: [T] = []
    
    var maxCount = 5
    
    func execute(data:T) {
        if !cache.contains(data) && maxCount == cache.count {
            cache.removeLast()
        } else {
            cache.remove(object: data)
        }
        cache.insert(data, at: 0)
    }
}

extension LRUArray:CustomStringConvertible {
    var description: String {
        return "当前数组里面含有的数据：\(cache)"
    }
}

extension LRUArray {
    
    static func test() {
        
        let lru = LRUArray<Int>()
        lru.execute(data: 1)
        lru.execute(data: 5)
        lru.execute(data: 10)
        lru.execute(data: 3)
        lru.execute(data: 4)
        
        print(lru)
        
        lru.execute(data: 2)
        
        print(lru)
        
    }
}
