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
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        guard let date = cal.dateByAddingUnit(.Minute, value: 1, toDate: NSDate(), options: NSCalendarOptions()) else { return }

        let reminder = UILocalNotification()
        reminder.fireDate = date
        reminder.alertBody = "You can now reply with text"
        reminder.alertAction = "Cool"
        reminder.soundName = "sound.aif"
        reminder.category = "CATEGORY_ID"

        UIApplication.sharedApplication().scheduleLocalNotification(reminder)

        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        print("Firing at \(formatter.stringFromDate(date))")
    }
}
