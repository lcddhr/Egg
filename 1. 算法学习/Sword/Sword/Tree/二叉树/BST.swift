//
//  BST.swift
//  Sword
//
//  Created by liuchendi on 2020/5/30.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import Foundation


class BST {
    
    // 求二叉树的深度
    static func deepth(root:TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = deepth(root: root.left)
        let right = deepth(root: root.right)
        return 1 + ((left >= right) ?  left : right)
    }
}

extension BST {
    
    static func testDeepth() {
        
        let tree = TreeNode.buildBSTData()
        print(deepth(root: tree)) 
    }
}
