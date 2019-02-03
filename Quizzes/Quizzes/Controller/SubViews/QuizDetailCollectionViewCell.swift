//
//  QuizDetailCollectionViewCell.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailCollectionViewCell: UICollectionViewCell {
    lazy var quizTextView: UILabel = {
        let textLabel = UILabel()
        textLabel.layer.borderWidth = 1.0
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        return textLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        self.layer.borderWidth = 2.0
        setUpTextView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpTextView()
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpTextView() {
        addSubview(quizTextView)
        quizTextView.translatesAutoresizingMaskIntoConstraints = false
        quizTextView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        quizTextView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        quizTextView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        quizTextView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}
