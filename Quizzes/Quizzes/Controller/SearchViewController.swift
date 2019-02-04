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
    override func viewWillAppear(_ animated: Bool) {
        checkUser()
    }
    private func checkUser() {
        if CurrentUser.shared.profile.usernameHolder == "@username" {
            let alertController = UIAlertController(title: "Invalid User", message: "Please create a valid username at the profile tab", preferredStyle: .alert)
            let submitAction = UIAlertAction(title: "OK", style: .default) { alert in
                self.searchView.searchCollectionView.isUserInteractionEnabled = false
            }
            alertController.addAction(submitAction)
            present(alertController, animated: true)
            
        } else {
            self.searchView.searchCollectionView.isUserInteractionEnabled = true
        }
        
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
        var titleCheck = [String]()
        // added line to prevent spamming
        DataManager.shared.firstVC.quizFavorites = QuizListModel.getQuiz()
        let dupeCheck = DataManager.shared.firstVC.quizFavorites
        for i in dupeCheck {
            titleCheck.append(i.quizTitle)
        }
        if titleCheck.contains(searchQuiz[sender.tag].quizTitle) {
            let alertController = UIAlertController(title: "Quiz exists already", message: "Can not add same quiz", preferredStyle: .alert)
            let submitAction = UIAlertAction(title: "OK", style: .default) { alert in
                
            }
            alertController.addAction(submitAction)
            present(alertController, animated: true)
        } else {
            let date = Date.getISOTimestamp()
            let quizFave = QuizFavorite.init(quizTitle: searchQuiz[sender.tag].quizTitle, facts: searchQuiz[sender.tag].facts, createdAt: date)
            QuizListModel.addQuiz(quiz: quizFave)
        }
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
