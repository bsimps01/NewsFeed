//
//  CategoriesVC.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/8/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CategoriesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let data = ["Business", "Health", "General", "Technology","Entertainment", "Science", "Sports"]
    
    let images = ["business", "health", "general", "technology", "entertainment", "science", "sports"]
    
    var articleImageView: UIImageView!
    
    var selectedIndexPath: IndexPath? {
        didSet {
            var indexPaths: [IndexPath] = []
            if let selectedIndexPath = selectedIndexPath {
                indexPaths.append(selectedIndexPath)
            }
            if let oldValue = oldValue {
                indexPaths.append(oldValue)
            }
            collectionView.performBatchUpdates({
                self.collectionView.reloadItems(at: indexPaths)
            })
        }
    }
    
    var article: Article? = nil {
        didSet {
            getImage(article: article!)
        }
    }
    
    func getImage(article: Article) {
        if let imageURL = article.urlToImage {
            articleImageView.kf.setImage(with: URL(string: imageURL), completionHandler: { result in
                switch result {
                case .success(let value):
                    print(value.image)
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
    
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
        //view.addSubview(articleImageView)
        navigationItem.title = "News Feed"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.categoryLabel.text = data[indexPath.row]

        if indexPath == selectedIndexPath{
            cell.backgroundColor = .cyan
        }else{
            cell.backgroundColor = .green
        }
        return cell
        
    }

    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell: CategoryCell = collectionView.cellForItem(at: indexPath) as! CategoryCell
//        cell.backgroundColor = .green
//        print("selected item in row \(indexPath.row)")
//        let categorySelection = data[indexPath.row]
//        NetworkAPI.shared.getArticles(category: categorySelection){ result in
//                switch result {
//                case let .success(articles):
//                    let nextView = ArticleVC()
//                    nextView.currentArticle = articles
//                    nextView.categorySelection = self.data[indexPath.row]
//
//                    self.navigationController?.pushViewController(nextView, animated: true)
//
//                case let .failure(error):
//                    print(error)
//                }
//                print(result)
//
//            }
//
//        }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
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
                if selectedIndexPath == indexPath {
                  selectedIndexPath = nil
                } else {
                  selectedIndexPath = indexPath
                }
                  return false
            }
    }
