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
        label.numberOfLines = 10
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 5.0
        label.textAlignment = .center
        return label
    }()
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("•••", for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 2.0
        return button
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
        setupButton()
    }
    private func setupLabel() {
        addSubview(quizLabel)
        quizLabel.translatesAutoresizingMaskIntoConstraints = false
        quizLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        quizLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
}
