//
//  Queue.swift
//  Sword
//
//  Created by liuchendi on 2021/11/14.
//  Copyright © 2021 liuchendi. All rights reserved.
//

import Foundation

class Queue<T> {
    
    fileprivate var list = Array<T>()
    
    private var isEmpty:Bool {
        return  list.count == 0
    }
    
    func enQueue(_ element: T) {
        list.append(element)
    }
    
    func deQueue() -> T? {
        if list.isEmpty {
            let first = list.first
            list.remove(at: 0)
            return first
        } else {
            return nil
        }
    }
    
    // 查看队列的一个元素
    public func peek() -> T? {
        return list.first
    }
}

extension Queue {
    public static func test() {
        let queue = Queue<String>()
        
        queue.enQueue("1")
        queue.enQueue("2")
        queue.enQueue("3")
        queue.enQueue("4")
        
        print("\(queue)")
    }
}

extension Queue: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "---Queue---\n"
        let bottomDivider = "-----------\n"
        var content = ""
        for item in list {
            content += "\(item)\n"
        }
        return topDivider + content + bottomDivider
    }
}
