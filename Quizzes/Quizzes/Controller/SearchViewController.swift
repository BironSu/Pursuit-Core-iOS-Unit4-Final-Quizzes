//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var searchView = SearchView()
    var searchQuiz = [Quiz]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.searchCollectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Search"
        searchView.searchCollectionView.dataSource = self
        view.addSubview(searchView)
        setUpCollectionView()
    }
    private func setUpCollectionView() {
        QuizAPIClient.getQuiz(data: nil) { (error, quiz) in
            if let error = error {
                print("Error at SearchVC: \(error)")
            } else if let quiz = quiz {
                self.searchQuiz = quiz
            }
        }
    }
    @objc private func addMenu(sender: UIButton) {
        let date = Date.getISOTimestamp()
        let quizFave = QuizFavorite.init(quizTitle: searchQuiz[sender.tag].quizTitle, facts: searchQuiz[sender.tag].facts, createdAt: date)
        QuizListModel.addQuiz(quiz: quizFave)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchQuiz.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(addMenu), for: .touchUpInside)
        cell.quizLabel.text = searchQuiz[indexPath.row].quizTitle
        return cell
    }
    
    
}
