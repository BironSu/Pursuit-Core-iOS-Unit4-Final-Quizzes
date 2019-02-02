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
            createUser()
        }
    }
    @objc private func createUser() {
        let alertController = UIAlertController(title: "Please Enter Your Username", message: "No Spaces or Special Characters", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { alert in
            
            guard (alertController.textFields?.first?.text) != nil else {
                print("alertController textField is nil")
                return
            }
            
//            UserDefaults.standard.set(defaultSearch, forKey: )
            
        }
        alertController.addTextField { (textField) in
            textField.delegate = self as? UITextFieldDelegate
            textField.placeholder = "Enter username"
            textField.textAlignment = .center
            textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
        submitAction.isEnabled = false
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
    @objc private func textFieldDidChange(_ textfield: UITextField) {
        if let alert = presentedViewController as? UIAlertController,
            let action = alert.actions.last,
            textfield.text?.isEmpty == false {
            action.isEnabled = true
        } else if let alert = presentedViewController as? UIAlertController,
            let action = alert.actions.last,
            textfield.text?.isEmpty == true {
            action.isEnabled = false
        }
    }
}
