//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var createButton: UIBarButtonItem!

    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var factOneTextView: UITextView!
    @IBOutlet weak var factTwoTextView: UITextView!
    let quizTitlePlaceHolder = "Enter Quiz Title"
    let factOnePlaceHolder = "Enter Quiz Fact #1"
    let factTwoPlaceHolder = "Enter Quiz Fact #2"
    let emptyPlaceHolder = "Space left empty..."
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.isEnabled = false
        textViewSetUps()
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
        dismiss(animated: true, completion: nil)
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
            createButton.isEnabled = true
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
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.textColor = .gray
            textView.text = emptyPlaceHolder
        }
    }
}
