//
//  ViewController.swift
//  CleanArch
//
//  Created by Laura on 16/07/2020.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Subscribe to a FCM topic.
        // If the topic doesn't already exist, it is automatically created and any client can subscribe to it.
        Messaging.messaging().subscribe(toTopic: "weather") { error in
            debugPrint(error as Any)

            print("Subscribed to weather topic")
        }
    }
}
