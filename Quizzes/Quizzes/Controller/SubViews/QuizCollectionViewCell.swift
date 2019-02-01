//
//  QuizCollectionViewCell.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    lazy var quizLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "testing"
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 5.0
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setUpConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpConstraints()
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpConstraints() {
        setupLabel()
    }
    private func setupLabel() {
        addSubview(quizLabel)
        quizLabel.translatesAutoresizingMaskIntoConstraints = false
        quizLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        quizLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
