//
//  SearchView.swift
//  Quizzes
//
//  Created by Biron Su on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    lazy var searchCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 340, height: 500)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        
        var cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        
        cv.layer.borderWidth = 2.0
        cv.layer.cornerRadius = 10.0
        cv.backgroundColor = .yellow
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .green
        setUpConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpConstraints()
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpConstraints() {
        self.searchCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCell")
        setupCollectionView()
    }
    private func setupCollectionView() {
        addSubview(searchCollectionView)
        searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        searchCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        searchCollectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        searchCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}
