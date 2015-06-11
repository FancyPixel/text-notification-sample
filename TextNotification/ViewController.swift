//
//  ViewController.swift
//  TextNotification
//
//  Created by Andrea Mazzini on 10/06/15.
//  Copyright © 2015 Fancy Pixel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!
    
    @IBAction func scheduleAction() {
        NotificationHelper.scheduleNotification()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("receiveReply:"), name: nil, object: nil)
    }

    func receiveReply(notification: NSNotification) {
        if let info = notification.userInfo as? Dictionary<String,String>, let text = info["text"] {
            responseLabel.text = text
        }
    }
}
