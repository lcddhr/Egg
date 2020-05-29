//
//  TreeNode.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation

class TreeNode {
    var value:Int
    var left:TreeNode?
    var right:TreeNode?
    
    init(value:Int, left:TreeNode?, right:TreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
}
