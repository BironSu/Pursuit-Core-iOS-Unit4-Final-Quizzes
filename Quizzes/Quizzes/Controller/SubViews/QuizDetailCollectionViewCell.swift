//
//  QuizDetailCollectionViewCell.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailCollectionViewCell: UICollectionViewCell {
    lazy var quizTextView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        self.layer.borderWidth = 2.0
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpTextView() {
        addSubview(quizTextView)
        quizTextView.translatesAutoresizingMaskIntoConstraints = false
        quizTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizTextView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        quizTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        quizTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
}
