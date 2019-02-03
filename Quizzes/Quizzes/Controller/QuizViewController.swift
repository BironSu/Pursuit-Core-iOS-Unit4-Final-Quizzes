//
//  QuizViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizFavorites = [QuizFavorite]() {
        didSet {
            quizCollectionView.reloadData()
        }
    }
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
        quizFavorites = QuizListModel.getQuiz()
        self.quizCollectionView.dataSource = self
        self.quizCollectionView.delegate = self
        self.quizCollectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "QuizCollectionCell")
        self.title = "Quizzes"
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        quizFavorites = QuizListModel.getQuiz()
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

extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizFavorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionCell", for: indexPath) as? QuizCollectionViewCell else {
            return UICollectionViewCell()}
        let cellToSet = quizFavorites[indexPath.row]
        cell.quizLabel.text = cellToSet.quizTitle
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let quiz = quizFavorites[indexPath.row]
        guard let quizDetailVC = storyboard?.instantiateViewController(withIdentifier: "QuizDetailViewController") as? QuizDetailViewController else {
            print("QuizDetailViewController is nil")
            return
        }
        quizDetailVC.quiz = quiz
        navigationController?.pushViewController(quizDetailVC, animated: true)
    }
}


