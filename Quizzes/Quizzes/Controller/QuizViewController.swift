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
        layout.scrollDirection = .vertical
        var cv = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .yellow
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizCollectionView.dataSource = self
        self.quizCollectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "QuizCollectionCell")
        self.title = "Quizzes"
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
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

extension QuizViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionCell", for: indexPath) as? QuizCollectionViewCell else {
            return UICollectionViewCell()}
        cell.quizLabel.text = "Testinggsajfksajdsandklsandada sadn aslkdnaln alsnd alkd asklnd lkanalkdl anldnl nasldnaln lannkdln slnkjnsfdndskfnskfndsnfsnfs"
        return cell
    }
}


