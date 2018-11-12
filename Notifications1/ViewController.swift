//
//  ViewController.swift
//  Notifications1
//
//  Created by Sriram Prasad on 12/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
//placing notificationButton with Auto layouts
    
    let notificationButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Send Notification", for: .normal)
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(handleNotificaation), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(notificationButton)
        setupConstraints()
    }

//    hadling notification
    @objc private  func handleNotificaation(){
        let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "Subtitle"
            content.badge = 10
            content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.2, repeats: false)
        let notificationrequest = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(notificationrequest) { (error) in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
//    setup constraints fornotification button
private func  setupConstraints(){
    
    let constraints =
        [
    notificationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    notificationButton.heightAnchor.constraint(equalToConstant: 40),
    notificationButton.widthAnchor.constraint(equalToConstant: 150),
    notificationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
    }
}

