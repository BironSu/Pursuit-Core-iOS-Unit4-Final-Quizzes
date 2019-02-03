//
//  QuizDetailView.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailView: UIView {

    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 400)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        var cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        
        cv.backgroundColor = .white
        cv.layer.borderWidth = 10.0
        cv.layer.cornerRadius = 10.0
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    private func commonInit(){
        self.collectionView.register(QuizDetailCollectionViewCell.self, forCellWithReuseIdentifier: "QuizCell")
        backgroundColor = .white
        setUpConstraints()
    }
}
extension QuizDetailView {
    private func setUpConstraints() {
        setUpCollectionView()
    }
    private func setUpCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
}
