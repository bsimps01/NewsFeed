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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = categorySelection!
    }
    
    func setup() {
        self.view.addSubview(section)
        section.translatesAutoresizingMaskIntoConstraints = false
        section.dataSource = self
        section.delegate = self
        section.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        section.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        section.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        section.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        section.register(UINib(nibName: "ArticlesCell", bundle: nil), forCellReuseIdentifier: "ArticlesCell")
    }
}

extension ArticleVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesCell", for: indexPath) as! ArticlesCell
        //let article = currentArticle[indexPath.row]
        cell.article = currentArticle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                print("selected item in row \(indexPath.row)")
        let nextView: StoriesVC = StoriesVC()
        nextView.url = currentArticle[indexPath.row].url
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
}


