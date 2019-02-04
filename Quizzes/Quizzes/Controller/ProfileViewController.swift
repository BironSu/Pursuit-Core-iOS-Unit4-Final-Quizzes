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
    private var imagePickerViewController: UIImagePickerController!
    private var image: UIImage!
    var userNames = UserDefaults.standard.object(forKey: "Users Info") as? [String] ?? [String]()
    var usernameHolder = "@username" {
        didSet {
            CurrentUser.shared.profile = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        checkUserName()
        setupPickerViewController()
        image = imageButton.currentImage
    }
    private func setupPickerViewController() {
        imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        checkUserName()
        image = imageButton.currentImage
    }
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        imagePickerViewController.sourceType = .photoLibrary
        showImagePickerViewController()
    }
    private func showImagePickerViewController() {
        present(imagePickerViewController, animated: true, completion: nil)
    }
    @IBAction func userNamePressed(_ sender: UIButton) {
        createUser()
    }
    private func checkUserName() {
        if userName.currentTitle == "@username" {
            createUser()
        }
    }
    @objc private func createUser() {
        let alertController = UIAlertController(title: "Please Enter Your Username", message: "No Spaces or Special Characters", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { alert in
            
            if let userInput = alertController.textFields?.first?.text?.lowercased() {
                if self.userNames.isEmpty {
                    let alertCreatedController = UIAlertController(title: "Welcome!", message: "\(userInput) has been created!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default) { alert in
                        self.userName.setTitle("@\(userInput)", for: .normal)
                        self.userNames.append(userInput)
                        UserDefaults.standard.set(self.userNames, forKey: "UsersInfo")
                        self.usernameHolder = userInput
                    }
                    alertCreatedController.addAction(okAction)
                    self.present(alertCreatedController, animated: true)
                } else {
                        if self.userNames.contains(userInput) {
                            let alertWelcomeController = UIAlertController(title: "Logged in.", message: "Welcome back \(userInput)!", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "Ok", style: .default) {
                                alert in
                                // load userdefaults
                                self.userName.setTitle("@\(userInput)", for: .normal)
                                if let myImage = UserDefaults.standard.object(forKey: userInput) as? Data {
                                    self.image = UIImage(data: myImage)
                                    self.imageButton.setImage(self.image, for: .normal)
                                }
                                self.usernameHolder = userInput
                            }
                            alertWelcomeController.addAction(okAction)
                            self.present(alertWelcomeController, animated:  true)
                        } else {
                            let alertCreatedController = UIAlertController(title: "Welcome!", message: "\(userInput) has been created!", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "Ok", style: .default) { alert in
                                self.userName.setTitle("@\(userInput)", for: .normal)
                                self.userNames.append(userInput)
                                // make sure this is typed correctly...
                                UserDefaults.standard.set(self.userNames, forKey: "Users Info")
                                let myImage = self.image.pngData()
                                UserDefaults.standard.set(myImage, forKey: userInput)
                                self.usernameHolder = userInput
                            }
                            alertCreatedController.addAction(okAction)
                            self.present(alertCreatedController, animated: true)
                        }
                }
            }
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

extension ProfileViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageButton.setImage(image, for: .normal)
            let myImage = image.pngData()
            UserDefaults.standard.set(myImage, forKey:usernameHolder)
        } else {
            print("Image is nil")
        }
        dismiss(animated: true, completion: nil)
    }
}
