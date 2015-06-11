//
//  AppDelegate.swift
//  TextNotification
//
//  Created by Andrea Mazzini on 10/06/15.
//  Copyright © 2015 Fancy Pixel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        NotificationHelper.askPermission()
        
        return true
    }

    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        var userInfo = [NSObject: AnyObject]()
        userInfo["text"] = responseInfo[UIUserNotificationActionResponseTypedTextKey]
        NSNotificationCenter.defaultCenter().postNotificationName("text", object: nil, userInfo: userInfo)

        completionHandler()
    }

}
