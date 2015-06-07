//
//  AppDelegate.swift
//  ContactList
//
//  Created by Ollie Stringfield on 3/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let dataModel = DataModel()

    //initialises the dataModel
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //looks at the window property to find the UIWindow that contains the storyboard
        let navigationController = window!.rootViewController as! UINavigationController
        let controller = navigationController.viewControllers[0] as! ContactListViewController
        //set the dataModel in the ContactListViewController
        controller.dataModel = dataModel
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

