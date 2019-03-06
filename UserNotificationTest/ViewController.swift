//
//  ViewController.swift
//  UserNotificationTest
//
//  Created by Yash Patel on 26/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if error != nil {
                print("Authorization Unsuccessfull")
            }else {
                print("Authorization Successfull")
            }
        }
    }
    
    @IBAction func notifyPressed(_ sender: UIButton) {
        timedNotifications(inSeconds: 3) { (success) in
            if success {
                print("Successfully Notified")
            }
        }
    }
    
    func timedNotifications(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let content = UNMutableNotificationContent()
        
        content.title = "Breaking News"
        content.subtitle = "Yo whats up i am subtitle"
        content.body = "idbnqwkdnqwoidoqw;edn;owqdno;wqndo;qwndowqndoqwdn qwdkj"
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                completion(false)
            }else {
                completion(true)
            }
        }
    }
}


















