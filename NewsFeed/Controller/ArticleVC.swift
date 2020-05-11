//
//  ArticleVC.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/9/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleVC: UIViewController {
        
    static var identifier = "ArticleCell"
    
    let networkAPI = NetworkAPI()
    let section = UITableView()
    var currentArticle : [Article] = [] {
        didSet {
            section.reloadData()
        }
    }
    
    var categorySelection: String? = nil
    
    var articleImage: UIImageView = {
        var articleImage = UIImageView()
        articleImage.layer.cornerRadius = 10
        articleImage.clipsToBounds = true
        return articleImage
    }()
    
        
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setup()
            title = categorySelection!
        }
        
    func setup() {
            self.view.addSubview(section)
            section.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 1.0).isActive = true
            section.heightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.heightAnchor, multiplier: 1.0).isActive = true
            section.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            section.centerYAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerYAnchor).isActive = true
        }
}

extension ArticleVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentArticle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCell", for: indexPath) as! ArticlesCell
        let article = currentArticle[indexPath.row]
        cell.getImage(article: currentArticle[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item in row \(indexPath.row)")
        let nextView: StoriesVC = StoriesVC()
        nextView.url = currentArticle[indexPath.row].url
        self.navigationController?.pushViewController(nextView, animated: true)
            
        }

}


