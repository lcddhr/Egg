//
//  AppDelegate.swift
//  Sword
//
//  Created by liuchendi on 2020/5/29.
//  Copyright © 2020 liuchendi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        SubTreeSolution.testHasSubTree()
//        MirrorTreeSolution.testMirrorTree()
//        BFS.test()
//        SameTreeSolution.test()
//        TreeOrderSolution.printNode()
//        RebuildTreeSolution.test()
//        BSTKNode.test()
//        BST.testDeepth()
//        BST.testValueInBST=()
//        BST.testInsertNode()
//        BST.testDeleteNode()
//        MirrorTree.test()
//        MirrorTree.testByStack()
//        LRUArray<Int>.test()
//        LRUList<Dictionary<Sring, String>>.test()
//        LRUList<Dictionary<String, String>>.test()
//        ReverseList<Int>.test()
//        BackwardsKNode<Int>.test()
        MergeList.test()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

