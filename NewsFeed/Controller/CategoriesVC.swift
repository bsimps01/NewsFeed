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
    
    let data = ["Business", "Health", "General", "Technology","Entertainment", "Science", "Sports"]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "News Feed"
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.categoryLabel.text = data[indexPath.row]
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: CategoryCell = collectionView.cellForItem(at: indexPath) as! CategoryCell
        cell.backgroundColor = .green
        print("selected item in row \(indexPath.row)")
        let categorySelection = data[indexPath.row]
        NetworkAPI.shared.getArticles(category: categorySelection){ result in
                switch result {
                case let .success(articles):
                    let nextView = ArticleVC()
                    nextView.currentArticle = articles
                    nextView.categorySelection = self.data[indexPath.row]
                    
                    self.navigationController?.pushViewController(nextView, animated: true)
                    
                case let .failure(error):
                    print(error)
                }
                print(result)
                
            }
            
        }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        <#code#>
    }
        
        
    }
