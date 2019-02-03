//
//  QuizDetailViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailViewController: UIViewController {

    public var quiz: QuizFavorite!
    let detailView = QuizDetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        navigationItem.title = "Quiz"
        detailView.collectionView.dataSource = self
        detailView.collectionView.delegate = self
    }

}
extension QuizDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quiz.facts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizDetailCollectionViewCell else {return UICollectionViewCell()}
        cell.quizTextView.text = quiz.quizTitle
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizDetailCollectionViewCell {
            cell.quizTextView.text = quiz.facts[indexPath.row]
        }
    }
}
