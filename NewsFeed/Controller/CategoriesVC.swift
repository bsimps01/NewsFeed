//
//  CategoriesVC.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/8/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import Foundation
import UIKit

class CategoriesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let data: [NewsSource] = [NewsSource(name: "General", category: "General"),
                              NewsSource(name: "Entertainment", category: "Entertainment"),
                              NewsSource(name: "Sports", category: "Sports"),
                              NewsSource(name: "Science", category: "Science"),
                              NewsSource(name: "Health", category: "Health"),
                              NewsSource(name: "Technology", category: "Technology"),
                              NewsSource(name: "Business", category: "Business")
    ]
    
    lazy var collectionView: UICollectionView = {
        let lv = LayoutView()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: lv)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.setUp(with: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: CategoryCell = collectionView.cellForItem(at: indexPath) as! CategoryCell
        cell.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "News Feed"
    }
}
