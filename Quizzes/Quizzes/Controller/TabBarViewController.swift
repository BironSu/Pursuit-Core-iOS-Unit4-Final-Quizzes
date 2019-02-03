//
//  TabBarViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let identifier = viewController.restorationIdentifier, identifier == "Create" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Create") as! CreateViewController
            present(vc, animated: true, completion: nil)
            return false
        }
        return true
    }
}
