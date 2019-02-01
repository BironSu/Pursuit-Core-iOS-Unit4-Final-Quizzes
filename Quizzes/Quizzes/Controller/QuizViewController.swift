//
//  QuizViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    lazy var quizCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        var cv = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .yellow
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizCollectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "QuizCollectionCell")
        setupConstraints()
    }
    private func setupConstraints() {
        view.addSubview(quizCollectionView)
        quizCollectionView.translatesAutoresizingMaskIntoConstraints = false
        quizCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        quizCollectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        quizCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        quizCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
}

