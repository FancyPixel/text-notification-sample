//
//  NotificationHelper.swift
//  TextNotification
//
//  Created by Andrea Mazzini on 11/06/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

import UIKit

struct NotificationHelper {
    static func askPermission() {
        let textAction = UIMutableUserNotificationAction()
        textAction.identifier = "TEXT_ACTION"
        textAction.title = "Reply"
        textAction.activationMode = .Background
        textAction.authenticationRequired = false
        textAction.destructive = false
        textAction.behavior = .TextInput

        let category = UIMutableUserNotificationCategory()
        category.identifier = "CATEGORY_ID"
        category.setActions([textAction], forContext: .Default)
        category.setActions([textAction], forContext: .Minimal)

        let categories = NSSet(object: category) as! Set<UIUserNotificationCategory>
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: categories)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }

    static func scheduleNotification() {
        let now: NSDateComponents = NSCalendar.currentCalendar().components([.Hour, .Minute], fromDate: NSDate())

        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let date = cal.dateBySettingHour(now.hour, minute: now.minute + 1, second: 0, ofDate: NSDate(), options: NSCalendarOptions())
        let reminder = UILocalNotification()
        reminder.fireDate = date
        reminder.alertBody = "You can now reply with text"
        reminder.alertAction = "Cool"
        reminder.soundName = "sound.aif"
        reminder.category = "CATEGORY_ID"

        UIApplication.sharedApplication().scheduleLocalNotification(reminder)

        print("Firing at \(now.hour):\(now.minute+1)")
    }
}
