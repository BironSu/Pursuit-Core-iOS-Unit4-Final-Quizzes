//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    var quizFavorites = QuizListModel.getQuiz()
    @IBOutlet weak var createButton: UIBarButtonItem!

    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var factOneTextView: UITextView!
    @IBOutlet weak var factTwoTextView: UITextView!
    let quizTitlePlaceHolder = "Enter Quiz Title"
    let factOnePlaceHolder = "Enter Quiz Fact #1"
    let factTwoPlaceHolder = "Enter Quiz Fact #2"
    let emptyPlaceHolder = "Space left empty..."
    var createable = false
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.isEnabled = false
        textViewSetUps()
    }
    override func viewWillAppear(_ animated: Bool) {
        checkUser()
    }
    private func checkUser() {
        if CurrentUser.shared.profile.usernameHolder == "@username" {
            let alertController = UIAlertController(title: "Invalid User", message: "Please create a valid username at the profile tab", preferredStyle: .alert)
            let submitAction = UIAlertAction(title: "OK", style: .default) { alert in
                self.quizTextView.isEditable = false
            }
            alertController.addAction(submitAction)
            present(alertController, animated: true)
            
        } else {
            self.quizTextView.isEditable = true
        }
        
    }
    private func textViewSetUps() {
        quizTextView.text = quizTitlePlaceHolder
        factOneTextView.text = factOnePlaceHolder
        factTwoTextView.text = factTwoPlaceHolder
        quizTextView.layer.borderWidth = 1.0
        quizTextView.layer.cornerRadius = 5.0
        quizTextView.textColor = .gray
        factOneTextView.textColor = .gray
        factTwoTextView.textColor = .gray
        factTwoTextView.isEditable = false
        factOneTextView.isEditable = false
        quizTextView.delegate = self
        factOneTextView.delegate = self
        factTwoTextView.delegate = self
    }
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createPressed(_ sender: UIBarButtonItem) {
        if createable == true {
            let date = Date.getISOTimestamp()
            let quizFavorite = QuizFavorite.init(quizTitle: quizTextView.text, facts: [factOneTextView.text, factTwoTextView.text], createdAt: date)
            QuizListModel.addQuiz(quiz: quizFavorite)
            DataManager.shared.firstVC.quizFavorites = QuizListModel.getQuiz()
            dismiss(animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Failed to create", message: "Please make sure there is a title and two facts.", preferredStyle: .alert)
            let submitAction = UIAlertAction(title: "OK", style: .default) { alert in
                self.quizTextView.isEditable = false
            }
            alertController.addAction(submitAction)
            present(alertController, animated: true)
        }
    }
}

// I want to make this more dummy proof but got to finish exam first... Hopefully I remember to come back here.
extension CreateViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == quizTitlePlaceHolder || textView.text == factOnePlaceHolder || textView.text == factTwoPlaceHolder || textView.text == emptyPlaceHolder {
            textView.text = ""
            textView.textColor = .black
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        if quizTextView.text.count > 1 {
            factOneTextView.isEditable = true
        } else {
            createButton.isEnabled = false
            factOneTextView.isEditable = false
        }
        if factOneTextView.text.count > 1 && factOneTextView.text != factOnePlaceHolder {
            factTwoTextView.isEditable = true
        } else {
            factTwoTextView.isEditable = false
        }
        if factTwoTextView.text.count > 0 && factTwoTextView.text != factTwoPlaceHolder && factTwoTextView.text != emptyPlaceHolder {
            createButton.isEnabled = true
            createable = true
        } else {
            createable = false
            // Set createButton.isEnabled to true for alerts
            createButton.isEnabled = true
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.textColor = .gray
            textView.text = emptyPlaceHolder
        }
    }
}
