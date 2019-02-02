//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var userName: UIButton!
    let usernameHolder = "@username"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        checkUserName()
    }
    override func viewWillAppear(_ animated: Bool) {
        checkUserName()
    }
    @IBAction func imageButtonPressed(_ sender: UIButton) {
    }
    @IBAction func userNamePressed(_ sender: UIButton) {
    }
    
    private func checkUserName() {
        if userName.currentTitle == usernameHolder {
            
        }
    }
}
